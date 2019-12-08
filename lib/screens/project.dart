import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatelessWidget {
  const Project({
    @required this.title,
    @required this.imageURL,
    @required this.description,
    this.url,
  });

  final String title;
  final String imageURL;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    var img = 'https://feltes.herokuapp.com/Portfolio/$imageURL';
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
              Image.network(img),
              SizedBox(
                height: 18,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 18,
              ),
              Visibility(
                visible: url != null,
                child: FlatButton(
                  color: Color(0xFF2c3e50),
                  child: Text(
                    "Check the website",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
