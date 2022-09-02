import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../shared/constant.dart';
import '../../shared/theme/Images.dart';
import '../../shared/theme/colors/const_colors.dart';
import '../Bloc/network_cubit/connection_checker_cubit.dart';
import '../Bloc/network_cubit/network_cubit.dart';

class SplashScreen extends StatefulWidget {
  final Widget? screen;
  const SplashScreen({Key? key,this.screen}) : super(key: key);

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
    return Scaffold(
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
                        "assets/lottie/nointernet.json",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height:  Constant.size(context).height * .15,
                    ),
                    Text(
                      "No Internet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize:  Constant.size(context).width * .045,
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
                width:  Constant.size(context).width,
                height:  Constant.size(context).height,
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(appLogo),
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
    );
  }
}
