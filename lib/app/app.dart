import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sllctask/shared/screens/splash_screen.dart';
import '../features/FireBase_Authentication/provider/signin_controller.dart';
import '../resources/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SignInGoogleProvider(),
          ),

          // BlocProvider<LocationCubit>(create: (context) => LocationCubit()),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          useInheritedMediaQuery: true,
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
