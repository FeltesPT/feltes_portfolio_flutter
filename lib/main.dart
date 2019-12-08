import 'package:feltes_portfolio/screens/project.dart';
import 'package:flutter/material.dart';
import 'package:feltes_portfolio/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feltes',
      home: Home(),
    );
  }
}
