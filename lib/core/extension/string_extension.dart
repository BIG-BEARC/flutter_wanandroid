
/// * @Author: chuxiong
/// * @Created at: 2020/12/15 10:29 AM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description string 扩展类
extension StringFit on String{

  String get defaultWithEmpty{
    if(this==null||this.isEmpty){
      return "--";
    }
    return this;
  }
}