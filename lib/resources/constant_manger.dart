// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys

// flutter pub run flutter_native_splash:create --E:\Flutter Projects\hr_system\file.yaml


import 'dart:ui';

class AppConstant {
  static const int splashDelay = 1;
  static const int splashAnimationDelay = 2;
  static const Duration kExpand = Duration(milliseconds: 200);
  static Locale? locale;
  static const Locale arabic = Locale('ar');
  static const Locale english = Locale('en');
}
