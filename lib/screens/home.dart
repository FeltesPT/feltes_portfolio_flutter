import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// API
import 'package:feltes_portfolio/network/api.dart';
// Screens
import 'package:feltes_portfolio/screens/sections/contact.dart';
import 'package:feltes_portfolio/screens/sections/footer.dart';
import 'package:feltes_portfolio/screens/sections/homeBanner.dart';
import 'package:feltes_portfolio/screens/sections/portfolio.dart';
import 'package:feltes_portfolio/screens/sections/about.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  APIHelper api;
  var myInfo;

  @override
  void initState() {
    super.initState();

    api = APIHelper();
    getData();
  }

  void getData() async {
    var data = await api.getMyInfo();

    setState(() {
      myInfo = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (myInfo == null) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF2C3E50),
        ),
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

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 6,
          forceElevated: true,
          backgroundColor: Color(0xFF2c3e50),
          title: Text(
            'Feltes',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 20.0,
            ),
          ),
          pinned: true,
          expandedHeight: 190.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Column(
                children: <Widget>[
                  HomeBanner(
                    name: myInfo['name'],
                    title: myInfo['title'],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Portfolio(),
              About(
                about: myInfo['about'],
              ),
              Contact(),
              Footer(
                location: myInfo['address'],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
