import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:sllctask/resources/assets_manger.dart';
import 'package:sllctask/resources/font_manger.dart';
import '../Bloc/network_cubit/connection_checker_cubit.dart';
import '../Bloc/network_cubit/network_cubit.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({Key? key,}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionCheckerCubit>(create: (_) => ConnectionCheckerCubit(internetConnectionChecker: InternetConnectionChecker()),),
        BlocProvider<InternetCubit>(create: (_) => InternetCubit(connectivity: Connectivity()),),

      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Builder(
          builder: (context) {
            final connectionState = context.watch<ConnectionCheckerCubit>().state;
            final internetTypeState = context.watch<InternetCubit>().state;
            if (connectionState is InternetConnectionDisconnected) {
              return Center(

                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Lottie.asset(
                          AppLotty.noInternet,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height:  AppSize.size(context).height * .15,
                      ),
                      Text(
                        "No Internet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:  AppSize.size(context).width * .045,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }
            else if (connectionState is InternetConnectionConnected) {
              if (internetTypeState is InternetConnected && (internetTypeState.connectionType == ConnectionType.wifi || internetTypeState.connectionType == ConnectionType.mobile)) {

                return  Container(
                  width:  AppSize.size(context).width,
                  height:  AppSize.size(context).height,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              margin:  const EdgeInsets.all(15.0),
                              decoration:  const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.appLogo),
                                    fit: BoxFit.contain),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              }
            }
            return Container(
              color: Colors.white,
            );
          },
        )
      ),
    );
  }
}
