import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/core/model/home_entity.dart';
import 'package:flutter_wanandroid/core/services/http_utils.dart';
import 'package:flutter_wanandroid/ui/pages/base/base_state.dart';
import 'package:flutter_wanandroid/ui/pages/home/home_page_content.dart';
import 'package:flutter_wanandroid/ui/pages/web_page.dart';
import 'package:flutter_wanandroid/ui/share/size_fit.dart';
import 'package:flutter_wanandroid/ui/share/timestamp_utils.dart';
import 'package:flutter_wanandroid/ui/wideget/cx_refresh.dart';
import 'package:flutter_wanandroid/ui/wideget/dividers.dart';
import 'package:flutter_wanandroid/ui/wideget/state_widget.dart';


/// * @Author: chuxiong
/// * @Created at: 2020/12/19 6:52 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description
/// 混入 AutomaticKeepAliveClientMixin 并重写 wantKeepAlive 方法，解决pageView 结合bottomNavigationBar 重新加载初始化认问题
/// 或可以使用 IndexedStack 替换
class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  CXRefreshController _cxRefreshController;
  ScrollController _scrollController;

  List<HomeBannerEntity> bannerList = [];
  List<HomeData> articleList = [];

  @override
  void initState() {
    super.initState();
    print(" HomePage init ");
    _cxRefreshController = CXRefreshController();
    _scrollController = ScrollController();

  }

  @override
  void dispose() {
    _cxRefreshController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CXRefresh(
        firstRefresh: true,
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        firstRefreshWidget: buildFirstRefreshWidget(context),
        emptyWidget: bannerList.isEmpty && articleList.isEmpty ? buildEmptyWidget() : null,
        onLoad: () async {
          getData(false);
        },
        onRefresh: () async {
          getData(true);
        },
        controller: _cxRefreshController,
        child: HomePageContent(bannerList,articleList),
        scrollController: _scrollController,
      ),
    );
  }

  getData(bool isRefresh) {
    if (isRefresh) {
      HttpUtils.getHomePageBanner((bannerList) {
        this.bannerList = bannerList;
      }, error: (error) {})
          .then((value) {});
    }
    getArticleList(isRefresh);
  }

  void getArticleList(bool isRefresh) {
    HttpUtils.getHomePageArticleList(_cxRefreshController.getPageIndex(isRefresh), (homeEntity) {
      if (isRefresh) {
        articleList = homeEntity.datas;
        _cxRefreshController.getRefreshSucceed(homeEntity.pageCount, homeEntity.total, homeEntity.size);
      } else {
        _cxRefreshController.getLoadMoreSucceed(articleList, homeEntity.datas);
      }
      setState(() {});
    }, error: (errorEntity) {
      _cxRefreshController.getDataFail(isRefresh);
    });
  }


}
