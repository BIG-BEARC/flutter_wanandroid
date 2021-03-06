import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';
import 'package:flutter_wanandroid/ui/share/constant_and_string.dart';
import 'package:flutter_wanandroid/ui/wideget/cx_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'init_item.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/1 11:20
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class MainPage extends StatefulWidget {
  static const String routeName = '/MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title;
  int _selectedIndex = 0;
  PageController _pageController;


  @override
  void initState() {
    super.initState();
    title = CString.appName;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CXAppBar(
        title,
        canBack: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Fluttertoast.showToast(msg: 'menu');
          },
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 15.px),
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(msg: '搜索');
                  }))
        ],
      ),
      body: PageView.builder(
        itemBuilder: (ctx, index) {
          return pages[index];
        },
        onPageChanged: _onPageChange,
        controller: _pageController,
        itemCount: pages.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: bottomBarItems,
        //选中颜色
        fixedColor: Theme.of(context).primaryColor,
        //显示模式
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
      ),
    );
  }

  void onTap(index) {
    _selectedIndex = index;
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {});
  }

  _onPageChange(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        title = CString.appName;
        break;
      case 1:
        title = CString.tree;
        break;
      case 2:
        title = CString.navi;
        break;
      case 3:
        title = CString.project;
        break;
      default:
        title = CString.appName;
        break;
    }
    setState(() {});
  }
}
