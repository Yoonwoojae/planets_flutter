import 'package:flutter/material.dart';
import 'package:planets_flutter/HomePageBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'treva',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomePageBody(),
        ],
      ),
    );
  }
}

TextStyle baseTextStyle() {
  return TextStyle(fontFamily: 'Poppins');
}

TextStyle headerTextStyle() {
  return baseTextStyle().copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle regularTextStyle() {
  return baseTextStyle().copyWith(
    color: Color(0xffb6b2df),
    fontSize: 9.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle subHeaderTextStyle() {
  return regularTextStyle().copyWith(fontSize: 12.0);
}
