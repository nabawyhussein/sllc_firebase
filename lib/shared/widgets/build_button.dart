import 'package:flutter/material.dart';

class BuildDecoratedContainer extends StatelessWidget {
  BuildDecoratedContainer(
      {Key? key,
      required this.btnText,
     
      this.btnColor = Colors.white,
      })
      : super(key: key);
  final String btnText;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Container(
            alignment: Alignment.center,
            width: size.width * 0.85,
            height: size.height * 0.06,
            margin: EdgeInsets.only(top: size.height * .015),
            decoration: BoxDecoration(
              color: btnColor,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(btnText,
                style: const TextStyle(
                    color:  Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          );
  }
}
