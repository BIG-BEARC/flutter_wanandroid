import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/pages/home/home_page.dart';
import 'package:flutter_wanandroid/ui/pages/navi/navi_page.dart';
import 'package:flutter_wanandroid/ui/pages/project/project_page.dart';
import 'package:flutter_wanandroid/ui/pages/tree/tree_page.dart';
import 'package:flutter_wanandroid/ui/share/constant_and_string.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/20 11:39 AM
/// * @Email:
/// * @Company: 嘉联支付
/// * description

final List<Widget> pages = [
  HomePage(),
  TreePage(),
  NaviPage(),
  ProjectPage(),
];

final List<BottomNavigationBarItem> bottomBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: CString.home),
  BottomNavigationBarItem(icon: Icon(Icons.filter_list), label: CString.tree),
  BottomNavigationBarItem(icon: Icon(Icons.low_priority), label: CString.navi),
  BottomNavigationBarItem(icon: Icon(Icons.apps), label: CString.project),
];
