// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys

// flutter pub run flutter_native_splash:create --E:\Flutter Projects\hr_system\file.yaml

import 'package:flutter/material.dart';

roundedValue(Size size) {
  return size.width * 0.07;
}

// const String googleMapKey = "AIzaSyB15QwXZhbSO8baKuybnwIWaVhJHXw71w0";

const Locale arabic = Locale('ar');
const Locale english = Locale('en');

class Constant {
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static roundedValue(Size size) {
    return size.width * 0.025;
  }
}
