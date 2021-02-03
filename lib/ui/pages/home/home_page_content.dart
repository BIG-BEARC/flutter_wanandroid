import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/core/model/home_entity.dart';
import 'package:flutter_wanandroid/ui/pages/web_page.dart';
import 'package:flutter_wanandroid/ui/share/size_fit.dart';
import 'package:flutter_wanandroid/ui/share/timestamp_utils.dart';
import 'package:flutter_wanandroid/ui/wideget/dividers.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/2/3 15:17
/// * @Email:
/// * @Company: 嘉联支付
/// * description 首页内容
class HomePageContent extends StatefulWidget {
  final List<HomeBannerEntity> bannerList;
  final List<HomeData> articleList;

  HomePageContent(this.bannerList, this.articleList);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  SwiperController _swiperControl;
  SwiperPagination _swiperPagination;
  @override
  void initState() {
    super.initState();
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
    _swiperControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBanner(),
        buildList(),
      ],
    );
  }

  buildBanner() {
    if (widget.bannerList.isEmpty) {
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
        itemBuilder: (ctx, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.bannerList[index].imagePath,
                  ),
                  fit: BoxFit.fill),
            ),
          );
        },

        controller: _swiperControl,
        itemCount: widget.bannerList.length,
        autoplay: true,
        //自动播放间隔时间 毫秒l
        autoplayDisableOnInteraction: true,
        //在拖拽的时候停止自动播放
        pagination: _swiperPagination,
        //指示器
        viewportFraction: 0.8,
        //视图宽度，即显示的item的宽度屏占比
        scale: 0.9,
        //两侧item的缩放比
        onTap: (index) {},
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        var articleInfo = widget.articleList[index];
        return GestureDetector(
          child: Container(
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
                                  SizedBox(
                                    width: 5.px,
                                  ),
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
                                  SizedBox(
                                    width: 5.px,
                                  ),
                                  Text(TimeStampUtils.stringTimeFormat(articleInfo.niceShareDate)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(articleInfo.collect ? Icons.favorite : Icons.favorite_border),
                                  SizedBox(
                                    width: 5.px,
                                  ),
                                  Text('收藏'),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    )),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.pushNamed(context, WebPage.routeName, arguments: WebInfo(url: articleInfo.link, title: articleInfo.title));
                    })
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, WebPage.routeName, arguments: WebInfo(url: articleInfo.link, title: articleInfo.title));
          },
        );
      },
      separatorBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Dividers.buildItemDivider(),
        );
      },
      itemCount: widget.articleList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
