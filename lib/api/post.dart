import 'package:cubes/constants.dart';
import 'package:cubes/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  static Future<List<Article>> getAll() async {
    var response = await http.get(Uri.parse("$apiUrl/posts"));
    Map<String, dynamic> content = json.decode(response.body);
    return Article.map(content);
  }

  static Future<void> updateLikes(int articleLikes) async {
    articleLikes++;
    await http.get(Uri.parse("$apiUrl/post/update/likes"));
  }
}
