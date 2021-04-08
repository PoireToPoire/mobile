import 'dart:convert';

import 'package:cubes/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:cubes/constants.dart';

class UserAPI {
  static Future<User> getByID(int index) async {
    var response = await http.get(Uri.parse("$apiUrl/user/$index"));
    Map<String, dynamic> content = json.decode(response.body);
    return User.build(content);
  }
}
