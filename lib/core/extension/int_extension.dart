
import 'package:flutter_wanandroid/ui/share/size_fit.dart';

extension IntFit on int {
  double get px {
    return CXSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return CXSizeFit.setRpx(this.toDouble());
  }
}