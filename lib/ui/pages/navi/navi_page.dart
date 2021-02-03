import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/base/base_state.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/19 6:53 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description
class NaviPage extends StatefulWidget {
  @override
  _NaviPageState createState() => _NaviPageState();
}

class _NaviPageState extends BaseState<NaviPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text('NaviPage'),
    );
  }
}
