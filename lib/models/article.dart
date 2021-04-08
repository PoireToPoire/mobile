import 'package:intl/intl.dart';

class Article {
  final String title;
  final String imgPath;
  final int likes;
  final String date;
  Article({this.title, this.imgPath, this.likes, this.date});

  String formatedDate() {
    return DateFormat.yMMMMEEEEd().format(DateTime.tryParse(this.date));
  }

  static List<Article> map(Map<String, dynamic> fetchResults) {
    List<Article> listOfArticle = [];
    if (fetchResults != null) {
      fetchResults.forEach((key, value) {
        listOfArticle.add(Article(
          title: fetchResults[key]["title"].toString(),
          likes: fetchResults[key]["likes"],
          date: fetchResults[key]["date"].toString(),
          imgPath: fetchResults[key]["picture"],
        ));
      });
    }
    return listOfArticle;
  }
}
