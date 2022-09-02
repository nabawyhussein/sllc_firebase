import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sllctask/resources/style_manger.dart';

import 'color_manger.dart';

appTheme() {
  return ThemeData(
    ///AppBarTheme
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: const IconThemeData(color: ColorManger.darkGrey),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    ///card theme
    cardTheme: const CardTheme(
        color: ColorManger.white,
        shadowColor: ColorManger.primary,
        elevation: 1),

    ///button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManger.white,
      buttonColor: ColorManger.primary,
    ),

    ///elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManger.white, fontSize: 20),
          primary: ColorManger.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    ),

    ///input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: getRegularStyle(fontSize: 14, color: ColorManger.grey),
        errorStyle: getRegularStyle(color: ColorManger.error),

        /// enabled Border style
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManger.primary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        /// focused Border style
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        /// error border style
        errorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManger.error, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        /// error border style
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )),
  );
}

darkThemeStatusBar() => const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );
