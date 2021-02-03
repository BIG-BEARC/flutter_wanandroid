

/// * @Author: chuxiong
/// * @Created at: 2020/12/8 2:52 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description 请求报错基类，{“code”: 0, “message”: “”}
class ErrorEntity{
  int code;
  String message;

  ErrorEntity({this.code, this.message});
}