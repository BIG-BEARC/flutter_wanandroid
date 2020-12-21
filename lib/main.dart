import 'package:flutter/material.dart';
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
