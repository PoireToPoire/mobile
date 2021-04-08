import 'package:cubes/constants.dart';
import 'package:cubes/screens/home.dart';
import 'package:cubes/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pear2Pear',
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: primaryColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor)),
        home: Material(
          child: FutureBuilder(
            future: FlutterSession().get("currentUser"),
            builder: (context, snapshot) {
              return snapshot.hasData ? HomeScreen() : LoginScreen();
            },
          ),
        ));
  }
}
