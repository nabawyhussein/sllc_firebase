import 'package:flutter/cupertino.dart';

class FontsManger {
  static const fontFamily = "";
}

class FontWeightManger {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppSize {
  static Size _size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static Size size(BuildContext context) {
    return _size(context);
  }
}
