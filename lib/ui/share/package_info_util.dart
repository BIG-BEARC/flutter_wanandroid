import 'package:package_info/package_info.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/18 3:20 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description 包信息
class PackageInfoUtils {
  //APP名称
  static String appName='Unknown';
  //包名
  static String packageName='Unknown';
  //版本名
  static String version='Unknown';
  //版本号
  static String buildNumber='Unknown';

  static void initialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}