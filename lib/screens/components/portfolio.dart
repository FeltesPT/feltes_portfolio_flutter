import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:feltes_portfolio/network/api.dart';

import 'package:feltes_portfolio/models/project.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  APIHelper api;
  List<Project> myProjects;

  @override
  void initState() {
    super.initState();

    api = APIHelper();
    getData();
  }

  void getData() async {
    var data = await api.getPortfolio();

    List<Project> projects = [];
    for (var projInfo in data) {
      var proj = Project(
          title: projInfo['name'],
          description: projInfo['description'],
          imageName: projInfo['photo'],
          url: projInfo['url']);

      projects.add(proj);
    }

    setState(() {
      myProjects = projects;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (myProjects == null) {
      return Container(
        decoration: BoxDecoration(color: Color(0xFF2c3e50)),
        child: Center(child: SpinKitCubeGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            );
          },
        )),
      );
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PortfolioCard(
                title: myProjects[0].title,
                imageURL: myProjects[0].imageName,
                description: myProjects[0].description,
              ),
              PortfolioCard(
                title: myProjects[1].title,
                imageURL: myProjects[1].imageName,
                description: myProjects[1].description,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 6,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
