import 'package:flutter/material.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/20 11:32 AM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
abstract class BaseState<T> extends State with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
}