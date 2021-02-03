
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/share/share_utils.dart';
import 'package:flutter_wanandroid/ui/wideget/cx_appbar.dart';
import 'package:flutter_wanandroid/ui/wideget/state_widget.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/2/2 15:09
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class WebPage extends StatefulWidget {
  static const String routeName = '/WebPage';

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _webInfo = ModalRoute.of(context).settings.arguments as WebInfo;



    return WebviewScaffold(
      url: _webInfo.url,
      appBar: CXAppBar(
        '${_webInfo.title}',
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                ShareUtils.share('【${_webInfo.title}】${_webInfo.url}');
              })
        ],
      ),
      initialChild: buildFirstRefreshWidget(context),
    );
  }
}

class WebInfo {
  final String url;
  final String title;

  WebInfo({@required this.url, @required this.title}) : assert(url != null);
}
