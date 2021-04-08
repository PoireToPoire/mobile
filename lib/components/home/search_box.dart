import 'package:flutter/material.dart';
import 'package:cubes/constants.dart';
import 'package:flutter_svg/svg.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key key, this.searchFunction}) : super(key: key);

  final Function searchFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 54,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: primaryColor.withOpacity(0.23)),
          ]),
      child: Row(children: <Widget>[
        Expanded(
          child: TextField(
            onChanged: searchFunction,
            decoration: InputDecoration(
                hintText: "Recherche",
                hintStyle: TextStyle(color: primaryColor.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
        SvgPicture.asset("assets/icons/search.svg",
            height: 20, width: 20, color: primaryColor.withOpacity(0.7)),
      ]),
    );
  }
}
