import 'package:cubes/constants.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  MoreButton({Key key, this.press}) : super(key: key);

  final Function press;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: primaryColor,
      onPressed: press,
      child: Text("More", style: TextStyle(color: Colors.white)),
    );
  }
}
