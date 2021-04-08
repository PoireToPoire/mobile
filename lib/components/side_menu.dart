import 'package:cubes/api/session.dart';
import 'package:cubes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/p2p.svg",
                width: size.width,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Deconnexion'),
            onTap: () async {
              Navigator.of(context).pop();
              await Session.logOut(context);
            },
          ),
        ],
      ),
    );
  }
}
