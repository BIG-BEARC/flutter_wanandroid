
import 'package:flutter_wanandroid/ui/share/size_fit.dart';

extension DoubleFit on double{
  double get px {
    return CXSizeFit.setPx(this);
  }

  double get rpx {
    return CXSizeFit.setRpx(this);
  }
}
