import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:feltes_portfolio/screens/components/sectionTitle.dart';

class Contact extends StatelessWidget {
  _sendEmail() async {
    const url = 'mailto:feltes.pt@gmail.com?subject=Let\'s work together!';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SectionTitle(
              title: "Contact Me",
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Send me an email to:',
                ),
                FlatButton(
                  onPressed: _sendEmail,
                  child: Text(
                    'feltes.pt@gmail.com',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
