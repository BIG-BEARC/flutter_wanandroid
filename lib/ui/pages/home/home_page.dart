import 'package:flutter/material.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/19 6:52 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('HomePage'),
    );
  }
}
