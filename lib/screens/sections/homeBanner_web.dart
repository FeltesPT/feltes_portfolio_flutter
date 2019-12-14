import 'package:flutter/material.dart';

class HomeBannerWeb extends StatelessWidget {
  HomeBannerWeb({this.name, this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isBigScreen = MediaQuery.of(context).size.width > 1200;
    bool isMediumScreen =
        MediaQuery.of(context).size.width > 800 && !isBigScreen;

    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.6,
            child: Image.network(
              "https://source.unsplash.com/3200x1800/?technology",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      NetworkImage("http://feltes.pt/img/profile.png"),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isBigScreen ? 36 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: isBigScreen ? 16 : isMediumScreen ? 8 : 0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isBigScreen ? 32 : 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
