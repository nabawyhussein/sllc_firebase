import 'package:flutter/cupertino.dart';
import 'constant_manger.dart';
import 'font_manger.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontsManger.fontFamily);
}



///regular Style
TextStyle getRegularStyle({double fontSize = 12, Color? color}) {
  return  _getTextStyle(fontSize, FontWeightManger.regular, color!);
}

///medium Style
TextStyle getMediumStyle({double fontSize = 12, Color? color}) {
  return _getTextStyle(fontSize, FontWeightManger.medium, color!);
}

///light Style
TextStyle getLightStyle({double fontSize = 12, Color? color}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color!);
}

///bold Style
TextStyle getBoldStyle({
  double fontSize = 12,
  Color? color,
}) {
  return  _getTextStyle(fontSize, FontWeightManger.bold, color!);
}

///semibold Style
TextStyle getSemiBoldStyle({double fontSize = 12, Color? color}) {
  return _getTextStyle(fontSize, FontWeightManger.semiBold, color!);
}

