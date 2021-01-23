import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/11/20 15:03
/// * @Email:
/// * @Company: 嘉联支付
/// * description 加载状态 widget

Widget buildFirstRefreshWidget(BuildContext context) {
  return Container(
    color: Colors.white,
    width: double.infinity,
    height: double.infinity,
    child: Center(
        child: SizedBox(
      height: 200.0,
      width: 300.0,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingCircle(
                color: Theme.of(context).primaryColor,
                size: 25.0,
              ),
            ),
            Container(
              child: Text("loading..."),
            )
          ],
        ),
      ),
    )),
  );
}

Widget buildEmptyWidget({String emptyImgName = "default_empty.png", String emptyDescribe = '空空如也...', Function onTap, String btnStr = ''}) {
  return Center(
    child: Container(
      height: 250.px,
      margin: EdgeInsets.symmetric(horizontal: 15.px),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.px)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(margin: EdgeInsets.only(top: 25.px), child: Image.asset('assets/images/$emptyImgName')),
          Padding(
            padding: EdgeInsets.only(top: 10.px, bottom: 22.px),
            child: Text(
              emptyDescribe,
             // style: TextAndColorConfig.textStyleForEmpty,
            ),
          ),
          btnStr.isEmpty
              ? SizedBox(
                  height: 1,
                )
              : SizedBox(
                  height: 50.px,
                  width: 205.px,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.px)),
                    child: Text(btnStr,
                       // style: TextAndColorConfig.textStyleForEmptyBtn
                    ),
                    onPressed: onTap,
                    //color: TextAndColorConfig.colorTextStateUnBind,
                  ),
                ),
          SizedBox(
            height: 12.px,
          )
        ],
      ),
    ),
  );
}
