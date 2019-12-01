import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({this.name, this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network("https://source.unsplash.com/1600x900/?technology"),
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage("http://feltes.pt/img/profile.png"),
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
