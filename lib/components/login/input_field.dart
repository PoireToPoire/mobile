import 'package:flutter/material.dart';
import 'package:cubes/constants.dart';

class LoginInputField extends StatelessWidget {
  const LoginInputField({
    Key key,
    this.placeholder,
    this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  final String placeholder;
  final Function onChanged;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.02),
      height: 50,
      padding: EdgeInsets.all(7),
      width: size.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: textColor.withOpacity(0.7)),
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                obscureText: isPassword,
                onChanged: onChanged,
                decoration: InputDecoration(
                    hintText: "$placeholder",
                    hintStyle: TextStyle(
                        fontSize: 18, color: primaryColor.withOpacity(0.5)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
        ],
      ),
    );
  }
}
