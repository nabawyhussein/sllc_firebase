import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sllctask/translations/codegen_loader.g.dart';
import 'app/app.dart';
void main() {
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

