import 'package:cubes/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key key, this.textValue}) : super(key: key);

  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 4),
            child: Text(
              textValue,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                margin: EdgeInsets.only(right: defaultPadding / 4),
                height: 7,
                color: primaryColor.withOpacity(0.2)),
          )
        ]));
  }
}
