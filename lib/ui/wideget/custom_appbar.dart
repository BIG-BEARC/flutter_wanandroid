/// * @Author: chuxiong
/// * @Created at: 2020/12/19
/// * @Email:
/// * @Company: 嘉联支付
/// * description:
///

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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/core/extension/int_extension.dart';
import 'package:flutter_wanandroid/core/extension/double_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final TextStyle style;
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

  CustomAppBar(
    this.text, {
    this.style,
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
    this.backgroundColor = Colors.white,
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
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset("assets/images/register_back.png"),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      title: title ??
          Text(
            text ?? "",
            style: style ??
                TextStyle(
                  fontSize: 18.px,
                  color: Color(0XFF333333),
                ),
          ),
      actions: actions,
      flexibleSpace: flexibleSpace,
      elevation: elevation ?? 0.5.px,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor ?? Colors.white,
      brightness: brightness ?? Brightness.light,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      textTheme: textTheme,
      primary: primary ?? true,
      centerTitle: centerTitle ?? true,
      excludeHeaderSemantics: excludeHeaderSemantics ?? false,
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: toolbarOpacity ?? 1.0,
      bottomOpacity: bottomOpacity ?? 1.0,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      bottom: bottom,
    );
  }
}
