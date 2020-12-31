import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/ui/share/global_config.dart';

import 'core/router/routers.dart';
import 'ui/share/colors.dart';

void main() {
  //runApp前调用，初始化绑定，手势、渲染、服务等
  WidgetsFlutterBinding.ensureInitialized();
  //初始化
 GlobalConfig.init().then((value)  {
   runApp(MyApp());
 });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去除右上角的Debug标签
      debugShowCheckedModeBanner: false,
      title: 'Wan Android',
      theme: ThemeData(
          primaryColor:Color(0xff2196F3),
          primaryColorDark:  Color(0xff1976D2),
          accentColor: Color(0xff448AFF),
      ),
      initialRoute: Routers.initialRoute,
      routes: Routers.routes,
      onGenerateRoute: Routers.generateRoute,
      onUnknownRoute: Routers.unKnownRoute,
    );
  }
}

///字体颜色
// 使用AppBar的brightness属性：Brightness.light为黑色，Brightness.dark为白色；
//
// 不使用AppBar时，可以通过嵌套AnnotatedRegion<SystemUiOverlayStyle>来实现。
SystemUiOverlayStyle setNavigationBarTextColor(bool light) {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    //有Appbar时，会被覆盖
    statusBarIconBrightness: light ? Brightness.light : Brightness.dark,
    statusBarBrightness: light ? Brightness.dark : Brightness.light,
  );
}