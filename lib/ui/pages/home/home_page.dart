import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/core/model/home_entity.dart';
import 'package:flutter_wanandroid/core/services/http_utils.dart';
import 'package:flutter_wanandroid/ui/pages/base/base_state.dart';
import 'package:flutter_wanandroid/ui/share/size_fit.dart';
import 'package:flutter_wanandroid/ui/share/timestamp_utils.dart';
import 'package:flutter_wanandroid/ui/wideget/cx_refresh.dart';
import 'package:flutter_wanandroid/ui/wideget/dividers.dart';
import 'package:flutter_wanandroid/ui/wideget/state_widget.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';

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
  SwiperController _swiperControl;
  SwiperPagination _swiperPagination;
  List<HomeBannerEntity> bannerList = [];
  List<HomeData> articleList = [];
  int bannerIndex = 0;

  @override
  void initState() {
    super.initState();
    print(" HomePage init ");
    _cxRefreshController = CXRefreshController();
    _scrollController = ScrollController();
    _swiperControl = SwiperController();
    _swiperPagination = SwiperPagination(
      // SwiperPagination.fraction 数字1/5，默认点
      builder: DotSwiperPaginationBuilder(
        size: 6,
        activeSize: 9,
      ),
    );
  }

  @override
  void dispose() {
    _cxRefreshController.dispose();
    _scrollController.dispose();
    _swiperControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            buildBanner(),
            buildList(),
          ],
        ),
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

      setState(() {
        _swiperControl.startAutoplay();
      });
    }, error: (errorEntity) {
      _cxRefreshController.getDataFail(isRefresh);
    });
  }

  buildBanner() {
    if (bannerList.isEmpty) {
      return SizedBox(
        width: 1,
        height: 1,
      );
    }

    return Container(
      width: CXSizeFit.screenWidth,
      height: CXSizeFit.screenWidth / 1.8 * 0.8,
      padding: EdgeInsets.only(top: 10.px),
      decoration: BoxDecoration(),
      child: Swiper(
        controller: _swiperControl,
        itemCount: bannerList.length,
        index: bannerIndex,
        autoplay: false,
        itemBuilder: (ctx, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              image: DecorationImage(
                  image: NetworkImage(
                    bannerList[index].imagePath,
                  ),
                  fit: BoxFit.fill),
            ),
          );
        },
        pagination: _swiperPagination,
        //视图宽度，即显示的item的宽度屏占比
        viewportFraction: 0.8,
        //两侧item的缩放比
        scale: 0.9,
        onTap: (index) {},
        onIndexChanged: (index) {
          bannerIndex = index;
        },
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        var articleInfo = articleList[index];
        return Container(
          margin: EdgeInsets.all(10.px),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articleInfo.title,
                        style: TextStyle(fontSize: 18.px),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 12.px,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.people_sharp),
                                SizedBox(width: 5.px,),
                                Text(articleInfo.author.isEmpty ? articleInfo.shareUser : articleInfo.author),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.timer),
                                SizedBox(width: 5.px,),
                                Text(TimeStampUtils.stringTimeFormat(articleInfo.niceShareDate)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(articleInfo.collect ? Icons.favorite : Icons.favorite_border),
                                SizedBox(width: 5.px,),
                                Text('收藏'),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  )),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
            ],
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Dividers.buildItemDivider(),
        );
      },
      itemCount: articleList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
