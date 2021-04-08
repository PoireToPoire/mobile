import 'package:cubes/components/side_menu.dart';
import 'package:cubes/models/article.dart';
import 'package:flutter/material.dart';
import 'package:cubes/constants.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key, this.article}) : super(key: key);

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(backgroundColor: primaryColor),
      backgroundColor: backgroundColor,
      body: Body(article: article),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key, this.article}) : super(key: key);

  final Article article;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(size.width * 0.1),
            decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 35)]),
            child: Image.network(widget.article.imgPath,
                scale: 1.0, repeat: ImageRepeat.noRepeat),
          ),
          Text(
            widget.article.title,
            style: TextStyle(
                color: textColor,
                fontSize: 30,
                fontFamily: "monospace",
                shadows: [
                  Shadow(
                    color: primaryColor,
                    blurRadius: 5,
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.all(size.width * 0.1),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: TextStyle(
                    color: textColor,
                  ),
                  text:
                      "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans. Un professeur du Hampden-Sydney College, en Virginie, s'est intéressé à un des mots latins les plus obscurs, consectetur, extrait d'un passage du Lorem Ipsum, et en étudiant tous les usages de ce mot dans la littérature classique, découvrit la source incontestable du Lorem Ipsum. Il provient en fait des sections 1.10.32 et 1.10.33 du De Finibus Bonorum et Malorum (Des Suprêmes Biens et des Suprêmes Maux) de Cicéron. Cet ouvrage, très populaire pendant la Renaissance, est un traité sur la théorie de l'éthique. Les premières lignes du Lorem Ipsum, Lorem ipsum dolor sit amet... proviennent de la section 1.10.32."),
            ),
          ),
          Container(
            margin: EdgeInsets.all(size.width * 0.1),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: textColor,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)]),
            height: 70,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "test",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "test",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
