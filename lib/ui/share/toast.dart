import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/23 2:53 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class Toast {
  static show({
    @required String msg,
    double fontSize,
    ToastGravity gravity,
    Color backgroundColor,
    Color textColor,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg,  fontSize: fontSize, gravity: gravity, backgroundColor: backgroundColor, textColor: textColor);
  }
}
