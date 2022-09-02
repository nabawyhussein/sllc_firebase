
import 'package:flutter/material.dart';


class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key? key,
      this.labelTxt,
      this.width,

      required this.textController,
      })
      : super(key: key);
  final String? labelTxt;
  final double? width;
  final TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: width ?? size.width * 0.85,
        // height: Constant.size(context).height * 0.06,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: textController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            fillColor: Colors.grey.withOpacity(.5),
            filled: true,
            border: InputBorder.none,
            hintText: labelTxt,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return " pleaseEnterCorrectData";
            }
            return null;
          },
        ));
  }
}
