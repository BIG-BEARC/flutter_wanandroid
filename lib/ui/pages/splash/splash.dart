
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/main/main_page.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/22 4:20 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed(MainPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/launcher_image.png',fit: BoxFit.fill,),
        ),
      ],
    );
  }
}
