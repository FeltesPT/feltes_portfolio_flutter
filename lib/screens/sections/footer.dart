import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:feltes_portfolio/screens/components/sectionTitle.dart';

class Footer extends StatelessWidget {
  const Footer({this.location});

  final String location;
  final String twitter = 'https://twitter.com/FeltesPt';
  final String linkedIn = 'https://www.linkedin.com/in/feltesPT';
  final String github = 'https://github.com/FeltesPT/';

  _openTwitter() async {
    if (await canLaunch(twitter)) {
      await launch(twitter);
    } else {
      throw 'Could not launch $twitter';
    }
  }

  _openLinkedIn() async {
    if (await canLaunch(linkedIn)) {
      await launch(linkedIn);
    } else {
      throw 'Could not launch $linkedIn';
    }
  }

  _openGithub() async {
    if (await canLaunch(github)) {
      await launch(github);
    } else {
      throw 'Could not launch $github';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40, top: 16),
      decoration: BoxDecoration(
        color: Color(0xFF2C3E50),
      ),
      child: Column(
        children: <Widget>[
          SectionTitle(
            title: "Location",
          ),
          Text(
            location,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SectionTitle(
            title: "Around the web",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                color: Colors.white,
                onPressed: _openTwitter,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedin),
                color: Colors.white,
                onPressed: _openLinkedIn,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.github),
                color: Colors.white,
                onPressed: _openGithub,
              ),
            ],
          )
        ],
      ),
    );
  }
}
