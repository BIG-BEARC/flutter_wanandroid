import 'package:flutter/material.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/1 11:16
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '错误页面',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            '错误页面',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ));
  }
}