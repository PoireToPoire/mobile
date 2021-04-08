import 'package:cubes/constants.dart';
import 'package:cubes/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:cubes/models/article.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({Key key, this.id, this.article}) : super(key: key);

  final String id;
  final Article article;

  @override
  _ArticleCard createState() => _ArticleCard();
}

class _ArticleCard extends State<ArticleCard> {
  int count = 0;
  bool pressed = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      count = widget.article.likes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.82,
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Image.network(widget.article.imgPath,
            scale: 1.0, repeat: ImageRepeat.noRepeat),
        Container(
          padding: EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: primaryColor.withOpacity(0.25))
              ]),
          child: Column(children: [
            Text(widget.article.formatedDate(),
                style: Theme.of(context).textTheme.button),
            Text(widget.article.title.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                    color: primaryColor,
                    fontFamily: "monospace",
                    fontSize: 20)),
            Row(children: [
              IconButton(
                  icon: Icon(Icons.remove_red_eye_rounded),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(article: widget.article)));
                  }),
              Spacer(),
              Badge(
                position: BadgePosition.topEnd(top: 1, end: -5),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.scale,
                badgeColor: pressed ? Colors.red : Colors.grey[600],
                badgeContent: Text(pressed ? "${count + 1}" : "$count",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    )),
                child: IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                      // Post.updateLikes(widget.likes);
                    });
                  },
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }
}
