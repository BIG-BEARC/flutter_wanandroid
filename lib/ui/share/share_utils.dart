import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/2/2 16:46
/// * @Email:
/// * @Company: 嘉联支付
/// * description
class ShareUtils {
  static void share(
    String text, {
    String subject,
    Rect sharePositionOrigin,
  }) {
    Share.share(text, subject: subject, sharePositionOrigin: sharePositionOrigin);
  }

  /// 分享文件
  /// 单文件 Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
  /// 多文件 Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
  static void shareFile(
    List<String> paths, {
    List<String> mimeTypes,
    String subject,
    String text,
  }) {
    Share.shareFiles(paths, mimeTypes: mimeTypes, subject: subject, text: text);
  }
}
