import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({@required this.title, this.color = Colors.white});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}
