import 'dart:convert';

import 'package:cubes/api/user.dart';
import 'package:cubes/constants.dart';
import 'package:cubes/models/credentials.dart';
import 'package:cubes/models/user.dart';
import 'package:cubes/screens/home.dart';
import 'package:cubes/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> signIn(User user) async {
    var response = await http.post(Uri.parse("$apiUrl/signin"),
        body: json.encode(user.toJson()));
    return (response.reasonPhrase == "OK");
  }

  static Future<bool> logIn(
      Credentials credentials, BuildContext context) async {
    bool connected = false;
    if (credentials.email != null && credentials.password != null) {
      var response = await http.post(
        Uri.parse("$apiUrl/login"),
        body: json.encode(credentials.toMap()),
      );
      if (response.reasonPhrase == "OK") {
        connected = true;
        User user =
            await UserAPI.getByID(json.decode(response.body)["user_id"]);
        await FlutterSession().set("currentUser", user);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
    return connected;
  }

  static Future<void> logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
