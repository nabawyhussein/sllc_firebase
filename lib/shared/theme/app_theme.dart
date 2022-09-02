import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors/const_colors.dart';

appTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // mainColor

    appBarTheme: AppBarTheme(
        // color: mainColor,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // mainColorLight,
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Colors.white,
      selectedItemColor: secondColor,
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
        // headline6: TextStyle(color: Colors.black)
        ),
  );
}

darkThemeStatusBar() => const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
var commonShadow= BoxShadow(
  color: Colors.grey.withOpacity(0.64),
  spreadRadius: .2,
  blurRadius: .1,
  offset: const Offset(2, 3), // changes position of shadow
);
