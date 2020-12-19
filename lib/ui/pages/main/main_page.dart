
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';
import 'package:flutter_wanandroid/ui/pages/home/home_page.dart';
import 'package:flutter_wanandroid/ui/pages/navi/navi_page.dart';
import 'package:flutter_wanandroid/ui/pages/project/project_page.dart';
import 'package:flutter_wanandroid/ui/pages/tree/tree_page.dart';
import 'package:flutter_wanandroid/ui/share/constant_and_string.dart';
import 'package:flutter_wanandroid/ui/wideget/custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/1 11:20
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class MainPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title;
  int curIndex = 0;
  PageController _pageController;
  var pages = <Widget>[
    HomePage(),
    TreePage(),
    NaviPage(),
    ProjectPage(),
  ];



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
      appBar: CustomAppBar(
        title,
        leading: Icon(Icons.menu),
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
      body: PageView.builder(itemBuilder: (ctx, index) {
        return pages[index];
      },
        controller: _pageController,
        itemCount:pages.length,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: CString.home),
          BottomNavigationBarItem(icon: Icon(Icons.filter_list),label: CString.tree),
          BottomNavigationBarItem(icon: Icon(Icons.low_priority),label: CString.navi),
          BottomNavigationBarItem(icon: Icon(Icons.apps),label: CString.project),
        ],
        //选中颜色
        fixedColor: Theme.of(context).primaryColor,
        //显示模式
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          curIndex = index;
          setState(() {

          });
        },
      ),
    );
  }
}
