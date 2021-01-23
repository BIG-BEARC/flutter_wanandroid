import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/23 3:03 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description
///分割线
class Dividers{
 static Widget buildItemDivider({Color lineColor}) {
    return Container(
      color: lineColor ?? Colors.grey[500],
      height: 1.px,
    );
  }
}
