import 'package:flutter_wanandroid/core/model/base/error_entity.dart';
import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/core/model/home_entity.dart';
import 'package:flutter_wanandroid/core/services/api.dart';
import 'package:flutter_wanandroid/core/services/dio_manager.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 5:57 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description

class HttpUtils {

  static getHomePageArticleList(int pageIndex, Function(HomeEntity) success, {Function(ErrorEntity) error}) {
    DioManager().request<HomeEntity>(method: HttpMethod.GET, path: Api.ARTICLE_LIST + '$pageIndex/json', success: success, error: error);
  }
  
  static Future getHomePageBanner(Function(List<HomeBannerEntity>)success, {Function(ErrorEntity) error}) async {
   return await DioManager().requestList<HomeBannerEntity>(method: HttpMethod.GET, path: Api.BANNER,success: success,error: error);
  }
}
