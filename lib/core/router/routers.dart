import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/main/main_screen.dart';
import 'package:flutter_wanandroid/ui/pages/state/unknow_screen.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/1 11:15
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
class Routers {
  static final String initialRoute = MainScreen.routeName;

  static RouteFactory unKnownRoute = (setting) {
    return MaterialPageRoute(builder: (ctx) {
      return UnKnownPage();
    });
  };

  static RouteFactory generateRoute = (setting) {
   /* if (setting.name == FCFilterScreen.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return FCFilterScreen();
          },
          fullscreenDialog: true);
    }*/
    return null;
  };

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (ctx) => MainScreen(),

  };
}
