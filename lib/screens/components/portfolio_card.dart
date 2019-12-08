import 'package:flutter/material.dart';

import 'package:feltes_portfolio/screens/project.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final String imageURL;
  final String description;

  const PortfolioCard(
      {Key key,
      @required this.title,
      @required this.imageURL,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = 'https://feltes.herokuapp.com/Portfolio/$imageURL';
    return Card(
      color: Colors.white,
      elevation: 6,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Project(
                  title: title,
                  imageURL: imageURL,
                  description: description,
                );
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Image.network(
                url,
                width: 150,
                height: 100,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
