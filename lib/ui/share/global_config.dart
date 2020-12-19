import 'package:flutter_wanandroid/ui/share/size_fit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 6:03 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description 全局配置
class GlobalConfig {
  //是否为release版，false 为 debug /Profile 模式
   bool isRelease  =  bool.fromEnvironment("dart.vm.product");
  static SharedPreferences _prefs;
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    HYSizeFit.initialize();//屏幕适配
    _prefs = await SharedPreferences.getInstance(); //sp存储
  }
}
