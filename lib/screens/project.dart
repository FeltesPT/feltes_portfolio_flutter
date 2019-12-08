import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  const Project(
      {@required this.title,
      @required this.imageURL,
      @required this.description});

  final String title;
  final String imageURL;
  final String description;

  @override
  Widget build(BuildContext context) {
    var url = 'https://feltes.herokuapp.com/Portfolio/$imageURL';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text(
          title,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(url),
              SizedBox(
                height: 18,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
