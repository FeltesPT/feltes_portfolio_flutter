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

  List<Row> createList(int numInRow) {
    List<Row> list = [];

    for (var project in myProjects) {
      if (list.isNotEmpty && list.last.children.length <= numInRow - 1) {
        list.last.children.add(
          PortfolioCard(
            project: project,
          ),
        );
      } else {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PortfolioCard(
                project: project,
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
    bool isBigScreen = MediaQuery.of(context).size.width > 1200;
    bool isMediumScreen =
        MediaQuery.of(context).size.width > 800 && !isBigScreen;

    int numInRow = isBigScreen ? 4 : isMediumScreen ? 3 : 2;

    if (myProjects == null) {
      return Container(
        constraints: BoxConstraints(
          minHeight: 400,
        ),
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: SpinKitCubeGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF2c3e50),
              ),
            );
          },
        )),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: 1200,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SectionTitle(
            title: "Portfolio",
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: createList(numInRow),
          ),
        ],
      ),
    );
  }
}
