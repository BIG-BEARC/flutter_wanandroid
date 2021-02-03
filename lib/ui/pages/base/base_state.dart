import 'package:flutter/material.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/20 11:32 AM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description 混入 AutomaticKeepAliveClientMixin 并重写 wantKeepAlive 方法，解决pageView 结合bottomNavigationBar 重新加载初始化认问题
abstract class BaseState<T> extends State with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
}