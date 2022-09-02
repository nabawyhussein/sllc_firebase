import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../shared/widgets/build_button.dart';
import '../../Storage/screens/home_screen.dart';
import '../provider/signin_controller.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/googlesignin.json",
              fit: BoxFit.scaleDown),
          InkWell(
            onTap: () async {
              login(context);
            },
            child: BuildDecoratedContainer(
              btnText: "login by Gmail",
              btnColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  void login(BuildContext context) async{
    final login =
    Provider.of<SignInGoogleProvider>(context, listen: false);

    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: "Hi " + FirebaseAuth.instance.currentUser!.displayName!,
            )),
      );
    }

    else {
      await login.googleLoginAuth();
      if (FirebaseAuth.instance.currentUser != null) {

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                title: "Hi " + login.user!.displayName!,
              )),
        );
      }
    }
  }
}
