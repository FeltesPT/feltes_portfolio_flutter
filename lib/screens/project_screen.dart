import 'package:feltes_portfolio/models/project.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    @required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    var img = 'https://feltes.herokuapp.com/Portfolio/${project.imageName}';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text(
          project.title,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: project.imageName,
                child: Image.network(img),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                project.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 18,
              ),
              Visibility(
                visible: project.url != null,
                child: FlatButton(
                  color: Color(0xFF2c3e50),
                  child: Text(
                    "Check the website",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (await canLaunch(project.url)) {
                      await launch(project.url);
                    } else {
                      throw 'Could not launch ${project.url}';
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
