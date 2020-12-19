import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/share/constant_and_string.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// * @Author: chuxiong
/// * @Created at: 2020/12/18
/// * @Email:
/// * @Company: 嘉联支付
/// * description:
///

/*
/// 公共请求header拦截器
class HeaderInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers[Constants.KEY_VERSION] = PackageInfoUtils.buildNumber;
    options.headers[Constants.KEY_OS_VERSION] = DevicesInfoUtils.osVersion;
    String value = TokenManager.instance.getAccessToken();
    if (value == null || value.isEmpty) {
      options.headers[Constants.KEY_TOKEN] = "Bearer " + Constants.DEFAULT_ACCESS_TOKEN;
    } else {
      options.headers[Constants.KEY_TOKEN] = "Bearer " + value;
    }
    if (options.data.runtimeType.toString() == "_InternalLinkedHashMap<String, dynamic>") {
      LinkedHashMap<String, dynamic> data = options.data;
      data.putIfAbsent("sign", () {
        return "";
      });
      print("*****************************************************");
      print(data);
      print("*****************************************************");
    }
    return super.onRequest(options);
  }
}

/// 通用的请求对话框拦截器
class RequestLoadingInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    RequestLoading.showLoading();
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    RequestLoading.hideLoading();
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    RequestLoading.hideLoading();
    return super.onError(err);
  }
}

/// 单独处理token过期逻辑
class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.response?.statusCode == 401) {
      RequestOptions options = err.response.request;
      DioManager().dio().lock();
      DioManager().dio().interceptors.responseLock.lock();
      DioManager().dio().interceptors.errorLock.lock();
      HttpEngine.refreshAccToken((tokenInfo) {
        print("刷新accessToken成功");
        Provider.of<TokenInfoVM>(navigatorKey.currentState.overlay.context, listen: false).tokenInfoEntity = tokenInfo;
        return DioManager().dio().request(options.path, options: options);
      }, (e) {
        print("刷新accessToken异常");
        Fluttertoast.showToast(msg: e.message);
        Navigator.pushAndRemoveUntil(
          navigatorKey.currentState.overlay.context,
          new MaterialPageRoute(builder: (context) => new UserLogin()),
          (Route<dynamic> route) => false,
        );
      }, () {
        print("刷新accessToken结束");
        DioManager().dio().unlock();
        DioManager().dio().interceptors.responseLock.unlock();
        DioManager().dio().interceptors.errorLock.unlock();
      });
      return super.onError(err);
    }
  }
}
*/
