import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/20 3:57 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description

class CXRefresh extends StatelessWidget {
  /// 控制器
  final EasyRefreshController controller;

  /// 刷新回调(null为不开启刷新)
  final OnRefreshCallback onRefresh;

  /// 加载回调(null为不开启加载)
  final OnLoadCallback onLoad;

  /// 是否开启控制结束刷新
  final bool enableControlFinishRefresh;

  /// 是否开启控制结束加载
  final bool enableControlFinishLoad;

  /// 任务独立(刷新和加载状态独立)
  final bool taskIndependence;
  final ScrollController scrollController;

  /// Header
  final Header header;

  /// Footer
  final Footer footer;

  /// 首次刷新
  final bool firstRefresh;

  /// 首次刷新组件
  /// 不设置时使用header
  final Widget firstRefreshWidget;
  final int headerIndex;

  /// 空视图
  /// 当不为null时,只会显示空视图
  /// 保留[headerIndex]以上的内容
  final Widget emptyWidget;

  /// 顶部回弹(Header的overScroll属性优先，且onRefresh和header都为null时生效)
  final bool topBouncing;

  /// 底部回弹(Footer的overScroll属性优先，且onLoad和footer都为null时生效)
  final bool bottomBouncing;

  /// 滚动行为
  final ScrollBehavior behavior;

  /// 子组件
  final Widget child;

  const CXRefresh(
      {Key key,
      @required this.controller,
      this.onRefresh,
      this.onLoad,
      this.enableControlFinishRefresh = false,
      this.enableControlFinishLoad = false,
      this.taskIndependence = false,
      this.scrollController,
      this.header,
      this.footer,
      this.firstRefresh,
      this.firstRefreshWidget,
      this.headerIndex,
      this.emptyWidget,
      this.topBouncing = true,
      this.bottomBouncing = true,
      this.behavior,
      @required this.child, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: controller,
      onRefresh: onRefresh,
      onLoad: onLoad,
      enableControlFinishRefresh: enableControlFinishRefresh,
      enableControlFinishLoad: enableControlFinishLoad,
      taskIndependence: taskIndependence,
      scrollController: scrollController,
      header: this.header ?? MaterialHeader(),
      footer: this.footer ?? MaterialFooter(),
      firstRefresh: firstRefresh,
      firstRefreshWidget: firstRefreshWidget,
      headerIndex: headerIndex,
      emptyWidget: emptyWidget,
      topBouncing: topBouncing,
      bottomBouncing: bottomBouncing,
      behavior: behavior,
      child: child,
    );
  }
}

class CXRefreshController<T> extends EasyRefreshController {
  // 是否是刷新数据 true为刷新 false为加载 默认是加载
  bool _isRefresh;

  // 总数据条数
  int total;

  //当前页面
  int _pageIndex;

  //每页数据
  int _pageSize;

  //总页数
  int pageCount;

  //是否没有更多数据了
  bool isNoMoreData;

  void getRefreshSucceed(int pageCount, int total, int pageSize) {
    _pageIndex = 1;
    _isRefresh = true;
    this.pageCount = pageCount;
    this._pageSize = pageSize;
    this.total = total;
    isNoMoreData = _pageIndex * _pageSize >= this.total;
    finishRefresh(success: true, noMore: isNoMoreData);
    finishLoad(success: true,noMore: isNoMoreData);
    resetRefreshState();
    resetLoadState();
  }

  void getRefreshFail() {
    _pageIndex = 1;
    _isRefresh = true;
    finishRefresh(success: false, noMore: false);
    finishLoad(success: false,noMore: isNoMoreData);
  }

  List<T> getLoadMoreSucceed(List<T> oldList, List<T> newList) {
    _isRefresh = false;
    oldList.addAll(newList);
    isNoMoreData = _pageIndex * pageCount >= total;
    finishLoad(success: true, noMore: isNoMoreData);
   // resetLoadState();
    return oldList;
  }

  void getLoadMoreFail() {
    _pageIndex--;
    _isRefresh = false;
    finishLoad(success: false, noMore: isNoMoreData);
  }

  int getPageIndex(bool isRefresh, {int initPageIndex = 0}) {
    this._isRefresh = isRefresh;
    return _isRefresh ? _pageIndex = initPageIndex : _pageIndex++;
  }

  void getDataFail(bool isRefresh) {
    if (isRefresh) {
      getRefreshFail();
    } else {
      getLoadMoreFail();
    }
  }
}
