import 'package:flutter_wanandroid/core/model/base/entity_factory.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 2:43 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description 数据基类2，返回的参数为 {“code”: 0, “message”: “”, “data”: []}
class BaseListEntity<T> {
  int code;
  String message;
  List<T> data;

  BaseListEntity({this.code, this.message, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = List();
    if (json['data'] != null) {
      (json['data'] as List).forEach((element) {
        mData.add(EntityFactory.generateOBJ(element));
      });
    }

    return BaseListEntity(
      code: json['errorCode'],
      message: json['errorMsg'],
      data: mData,
    );
  }
}
