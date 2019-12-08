import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// API
import 'package:feltes_portfolio/network/api.dart';
// Components
import 'package:feltes_portfolio/screens/components/sectionTitle.dart';
import 'package:feltes_portfolio/screens/components/portfolio_card.dart';
// Models
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

  List<TableRow> createList() {
    List<TableRow> list = [];

    for (var project in myProjects) {
      if (list.isNotEmpty && list.last.children.length == 1) {
        list.last.children.add(
          PortfolioCard(
            title: project.title,
            imageURL: project.imageName,
            description: project.description,
          ),
        );
      } else {
        list.add(
          TableRow(
            children: <Widget>[
              PortfolioCard(
                title: project.title,
                imageURL: project.imageName,
                description: project.description,
                url: project.url,
              ),
            ],
          ),
        );
      }
    }

    return list;
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
          SectionTitle(
            title: "Portfolio",
            color: Colors.black,
          ),
          Table(
            children: createList(),
          ),
        ],
      ),
    );
  }
}
