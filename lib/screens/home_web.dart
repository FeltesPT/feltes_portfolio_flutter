import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// API
import 'package:feltes_portfolio/network/api.dart';
// Screens
import 'package:feltes_portfolio/screens/sections/contact.dart';
import 'package:feltes_portfolio/screens/sections/footer.dart';
import 'package:feltes_portfolio/screens/sections/homeBanner_web.dart';
import 'package:feltes_portfolio/screens/sections/portfolio.dart';
import 'package:feltes_portfolio/screens/sections/about.dart';

class HomeWeb extends StatefulWidget {
  @override
  _HomeWebState createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
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
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3E50),
        title: Text(
          'Feltes',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeBannerWeb(
                  name: myInfo['name'],
                  title: myInfo['title'],
                ),
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
          ),
        ),
      ),
    );
  }
}
