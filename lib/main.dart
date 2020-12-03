import 'package:flutter/material.dart';

import 'core/router/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:Routers.initialRoute ,
      routes: Routers.routes,
      onGenerateRoute: Routers.generateRoute,
      onUnknownRoute: Routers.unKnownRoute,
    );
  }
}
