import 'package:flutter/material.dart';
import 'package:cubes/constants.dart';
import 'package:cubes/components/home/search_box.dart';

class ProfileWithSearchBox extends StatelessWidget {
  ProfileWithSearchBox(
      {Key key, this.username, this.searchFunction, this.profilePictureSrc})
      : super(key: key);

  final String username;
  final Function searchFunction;
  final String profilePictureSrc;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding * 2.5),
      height: size.height * 0.2, //20% de la taille totale de l'écran
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: 36 + defaultPadding),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
          ),
          child: Row(children: <Widget>[
            Text(username,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Spacer(),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(profilePictureSrc), fit: BoxFit.fill),
              ),
            ),
          ]),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SearchBox(searchFunction: searchFunction)),
      ]),
    );
  }
}
