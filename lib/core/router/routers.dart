import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/main/main_page.dart';
import 'package:flutter_wanandroid/ui/pages/state/unknow_screen.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/1 11:15
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class Routers {
  static final String initialRoute = MainPage.routeName;

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
    if (routes[setting.name] != null) {
      return CupertinoPageRoute(builder: routes[setting.name], settings: RouteSettings(name: setting.name, arguments: setting.arguments));
    }

    return null;
  };

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage(),
  };
}
