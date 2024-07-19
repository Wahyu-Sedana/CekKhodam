import 'package:responsive_sizer/responsive_sizer.dart';

import 'dimens.dart';

bool typeMobile = Device.screenType == ScreenType.mobile;
bool typeTablet = Device.screenType == ScreenType.tablet;
double responsivePaddingHorizontal = typeMobile ? paddingSizeLarge : 0.3.dp;
double responsivePaddingButton = typeMobile ? paddingSizeLarge : 0.38.dp;
double responsivePaddingButtonBottom = typeMobile ? sizeExtraLarge : 0.35.dp;
double responsivePaddingRowButton = typeMobile ? 0 : 0.35.dp;
double responsiveButton = typeMobile ? 140 : 30.w;
double responsiveIconPlusMin = typeMobile ? sizeLarge : 0.22.dp;
double responsiveIconShare = typeMobile ? 30 : 0.25.dp;
double responsiveRoundedRadius = typeMobile ? sizeMedium : sizeLarge;
double responsivePaddingDictionary = typeMobile ? sizeSmall : sizeLarge;
