import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/model/entity_factory.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 2:39 PM
/// * @Email:
/// * @Company: 嘉联支付
/// * description 数据基类，返回的参数为 {“code”: 0, “message”: “”, “data”: {}}
class BaseEntity<T> {
  int code;
  String message;
  T data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
        code: json['code'],
        message: json['message'],
        // data值需要经过工厂转换为我们传进来的类型
        data: EntityFactory.generateOBJ(json));
  }
}
