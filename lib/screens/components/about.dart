import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String about;

  const About({this.about});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF18BC9B),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "About",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              about,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
