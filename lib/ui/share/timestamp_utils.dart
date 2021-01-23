import 'package:intl/intl.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/23
/// * @Email:
/// * @Company: 嘉联支付
/// * description:
///
/*
 使用方法:
 1.import本文件: import 'package:jlleague/pub/utils/timestamp_utils.dart';
 2.调用方法A: stamp.timeString 返回结果为: 刚刚 2分钟前 1小时前 3天前
 3.调用方法B: stamp.timeFormat 返回结果为: 2020-11-11 09:12:32
 4.调用方法c: stamp.timeStampFormatData 返回结果为: 2020-11-11
 */

class TimeStampUtils {
  int time;

  TimeStampUtils(this.time);

  static handleDate(int timeStamp) {
    final nowTime = new DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    //jLog("nowTime == $nowTime  timeStamp == $timeStamp time == $time", StackTrace.current);
    final difference = nowTime.difference(time);

    if (difference.inDays > 1) {
      return (difference.inDays).toString() + '天前';
    } else if (difference.inDays == 1) {
      return '昨天'.toString();
    } else if (difference.inHours >= 1 && difference.inHours < 24) {
      return (difference.inHours).toString() + '小时前';
    } else if (difference.inMinutes > 5 && difference.inMinutes < 60) {
      return (difference.inMinutes).toString() + '分钟前';
    } else if (difference.inMinutes <= 5) {
      return '刚刚';
    }
  }

  static String timeStampFormat(int timeStamp) {
    final nowTime = new DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    final difference = nowTime.difference(time);
    if (difference.inDays <= 0) {
      return DateTime.fromMillisecondsSinceEpoch(timeStamp).toString().split(' ')[1].substring(0, 5);
    } else {
      return DateTime.fromMillisecondsSinceEpoch(timeStamp).toString().split('.')[0];
    }
  }

  static String timeStampFormatData(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time).toString().split(' ')[0];
  }

  static String getFormatDate({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(DateTime.now());
  }

  static String timeFormatDetailDate(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time).toString().split('.')[0];
  }
  ///处理 2021-01-19 01:02 格式时间
  static String stringTimeFormat(String time) {
    if(time ==null || time.isEmpty){
      return  "--";
    }
    if(time.contains('-')&&time.contains(' ')){
      return time.toString().split(' ')[0];
    }
    return time;
  }


}

extension timeToString on int {
  String get timeString {
    return TimeStampUtils.handleDate(this);
  }

  String get timeFormat {
    return TimeStampUtils.timeStampFormat(this);
  }

  String get timeFormatData {
    return this == 0 ? "--" : TimeStampUtils.timeStampFormatData(this);
  }

  String get timeFormatDetailDate {
    return TimeStampUtils.timeFormatDetailDate(this);
  }
}
