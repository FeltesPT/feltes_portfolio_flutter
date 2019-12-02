import 'package:feltes_portfolio/network/api.dart';
import 'package:feltes_portfolio/screens/components/homeBanner.dart';
import 'package:feltes_portfolio/screens/components/portfolio.dart';
import 'package:feltes_portfolio/screens/components/portfoliogrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text("Feltes"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxWidth: viewportConstraints.maxWidth,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    HomeBanner(
                      name: myInfo['name'],
                      title: myInfo['title'],
                    ),
                    Portfolio()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
