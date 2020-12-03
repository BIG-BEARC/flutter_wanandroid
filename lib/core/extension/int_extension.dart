
import 'package:flutter_wanandroid/ui/share/size_fit.dart';

extension IntFit on int {
  double get px {
    return HYSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return HYSizeFit.setRpx(this.toDouble());
  }
}