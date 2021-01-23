import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';
import 'package:flutter_wanandroid/core/extension/double_extension.dart';
/*  导入文件:

  基本使用方法:
  * 1. 如果使用默认的标题,传入text即可
  * CustomAppBar( "消息详情"),
  *
  * 2. 也可以再传入style设置标题字体
  * appBar: CustomAppBar(
        "消息详情",
        style: TextStyle(
          fontSize: 18.px,
          color: Color(0XFF333333),
        ),
      ),
  *
  * 3. 使用title,这个提提了是widget(传入title后, text 和 style 不再生效, 无需设置)
  * appBar: CustomAppBar(
        title: Text(
          "消息通知",
          style: TextStyle(fontSize: 18.px, color: Color(0XFF333333)),
        ),
      ),
 */

class CXAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final TextStyle style;

  ///是否展示back键
  final bool canBack;
  final onTap;
  final Widget leading;
  final Widget title;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final double elevation;
  final Color shadowColor;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double toolbarHeight;
  final double leadingWidth;

  final Size preferredSize;
  final PreferredSizeWidget bottom;

  CXAppBar(
    this.text, {
    this.style,
    this.canBack = true,
    this.onTap,
    // 下面是系统appbar需要的属性
    Key key,
    this.leading,
    this.title,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.flexibleSpace,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.backgroundColor ,
    this.brightness = Brightness.light,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.bottom,
  }) : preferredSize = Size.fromHeight(toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  @override
  _CXAppBarState createState() => _CXAppBarState();
}

class _CXAppBarState extends State<CXAppBar> {
  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: widget.canBack ?
          IconButton(
            icon: Image.asset("assets/images/register_back.png"),
            onPressed: widget.onTap??() => Navigator.of(context).pop(),
          ):widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
      title: widget.title ??
          Text(
            widget.text ?? "",
            style: widget.style ??
                TextStyle(
                  fontSize: 18.px,
                  color: Color(0XFF333333),
                ),
          ),
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
      elevation: widget.elevation ?? 0.5.px,
      shadowColor: widget.shadowColor,
      shape: widget.shape,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      brightness: widget.brightness ?? Brightness.light,
      iconTheme: widget.iconTheme,
      actionsIconTheme: widget.actionsIconTheme,
      textTheme: widget.textTheme,
      primary: widget.primary ?? true,
      centerTitle: widget.centerTitle ?? true,
      excludeHeaderSemantics: widget.excludeHeaderSemantics ?? false,
      titleSpacing: widget.titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: widget.toolbarOpacity ?? 1.0,
      bottomOpacity: widget.bottomOpacity ?? 1.0,
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: widget.leadingWidth,
      bottom: widget.bottom,
    );
  }
}
