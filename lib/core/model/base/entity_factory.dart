import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/core/model/home_entity.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 2:36 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description json转换辅助工厂，把json转为T
class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
    if (T.toString() == 'HomeEntity') {
      return HomeEntity().fromJson(json) as T;
    } else if (T.toString() == 'HomeBannerEntity') {
      return HomeBannerEntity().fromJson(json) as T;
    } else {
      return json as T;
    }
  }
}
