import 'package:connectivity/connectivity.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/model/base/base_entity.dart';
import 'package:flutter_wanandroid/core/model/base/base_list_entity.dart';
import 'package:flutter_wanandroid/core/model/base/error_entity.dart';
import 'package:flutter_wanandroid/core/services/api.dart';
import 'package:flutter_wanandroid/core/services/http_config.dart';
import 'package:flutter_wanandroid/ui/share/global_config.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 2:59 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description

typedef Success<T> = Function(T data);
typedef Fail<ErrorEntity> = Function(ErrorEntity errorEntity);

class DioManager {
  CancelToken cancelToken = CancelToken();
  static final DioManager _instance = DioManager._internal();

  factory DioManager() => _instance;
  Dio _dio;

  DioManager._internal() {
    /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
    /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
    /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
    /// 就会自动编码请求体.
    /// [responseType] 表示期望以那种格式(方式)接受响应数据。
    /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
    ///
    /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
    /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
    ///
    /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
    if (_dio == null) {
      // 或者通过传递一个 `options`来创建dio实例
      BaseOptions options = BaseOptions()
        ..baseUrl = Api.BASE_URL
        ..connectTimeout = HttpConfig.timeout
        ..receiveTimeout = HttpConfig.timeout
        ..receiveDataWhenStatusError = false
        ..responseType = ResponseType.json

        ///设置接收类型
        ..contentType = Headers.jsonContentType
        ..headers = {
          "version": HttpConfig.version,
        };
      //Cookie管理
      _dio = Dio(options);
      var cookieJar = CookieJar();
      _dio.interceptors.add(CookieManager(cookieJar));
      //拦截器
      _dio.interceptors.add(LogInterceptor(requestBody: true, requestHeader: GlobalConfig.isRelease, responseHeader: GlobalConfig.isRelease, responseBody: true));
    }
  }

  ///不同请求方法，不同的请求参数。按实际项目需求分，这里 get 是 queryParameters，其它用 data. FormData 也是 data
  /// 注意: 只有 post 方法支持发送 FormData.
  // 请求，返回参数为 T
  // method：请求方法，HttpMethod.POST等
  // path：请求地址
  // queryParameters：get 请求参数
  // data：post 请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(
      {@required HttpMethod method,
      @required String path,
      Map<String, dynamic> data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Function(T) success,
      Function(ErrorEntity) error,
      Function() complete}) async {
    //检查网络是否连接
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("网络已断开！");
      error(ErrorEntity(code: -200, message: "网络已断开！"));
      return Future.error(ErrorEntity(code: -200, message: "网络已断开！"));
    }
    try {
      _dio
          .request(path, data: data, queryParameters: queryParameters, options: Options(method: HttpMethodValues[method]), cancelToken: cancelToken ?? this.cancelToken)
          .then((response) {
        print(response.data);
        if (response != null) {
          BaseEntity entity = BaseEntity<T>.fromJson(response.data);
          if (entity.code == 0) {
            success(entity.data);
          } else {
            error(ErrorEntity(code: entity.code, message: entity.message));
          }
        } else {
          error(ErrorEntity(code: -1, message: "未知错误"));
        }
      }).whenComplete(() {
        if (complete != null) {
          complete();
        }
        print("网络请求结束");
      });
    } on DioError catch (e) {
      print(e.toString());
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，HttpMethod.POST等
  // path：请求地址
  // queryParameters：get 请求参数
  // data：post 请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(
      {@required HttpMethod method,
      @required String path,
      Map<String, dynamic> queryParameters,
      Map<String, dynamic> data,
      CancelToken cancelToken,
      Function(List<T>) success,
      Function(ErrorEntity) error,
      Function() complete}) async {
    try {
      //检查网络是否连接
      ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("网络已断开！");
        var errorEntity = ErrorEntity(code: -200, message: "网络已断开！");
        error(errorEntity);
        return Future.error(errorEntity);
      }
      _dio
          .request(path, data: data, queryParameters: queryParameters, options: Options(method: HttpMethodValues[method]), cancelToken: cancelToken ?? this.cancelToken)
          .then((response) {
        print(response.data);
        if (response != null) {
          BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
          if (entity.code == 0) {
            success(entity.data);
          } else {
            error(ErrorEntity(code: entity.code, message: entity.message));
          }
        } else {
          error(ErrorEntity(code: -1, message: "未知错误"));
        }
      }).whenComplete(() async {
        if (complete != null) {
          complete();
        }
        print("网络请求结束");
      });
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    if (token != null && !token.isCancelled) {
      token.cancel("cancelled");
    }
  }

  void cancelRequestsWithRelease(CancelToken token) {
    if (token != null && !token.isCancelled) {
      token.cancel("cancelled");
      token = null;
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            String errMsg = error.response.statusMessage;
            return ErrorEntity(code: errCode, message: errMsg);
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

//使用：HttpMethodValues[HttpMethod.POST]
const HttpMethodValues = {HttpMethod.GET: "get", HttpMethod.POST: "post", HttpMethod.DELETE: "delete", HttpMethod.PUT: "put"};

enum HttpMethod { GET, POST, DELETE, PUT }
