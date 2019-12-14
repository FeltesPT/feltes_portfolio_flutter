import 'package:flutter/material.dart';
import 'package:feltes_portfolio/screens/components/sectionTitle.dart';

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
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 1200,
          ),
          child: Column(
            children: <Widget>[
              SectionTitle(
                title: "About",
              ),
              Text(
                about,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
