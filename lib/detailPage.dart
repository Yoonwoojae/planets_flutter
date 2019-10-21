import 'package:flutter/material.dart';
import 'package:planets_flutter/model/Planet.dart';
import 'Style.dart';
import 'separator.dart';
import 'PlanetSummary.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(planet),
            _getGradient(),
            _getContent(planet),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
}

Container _getBackground(Planet planet) {
  return Container(
    child: Image.asset(
      planet.backgroundImg,
      fit: BoxFit.cover,
      height: 300.0,
    ),
    constraints: BoxConstraints.expand(height: 300.0),
  );
}

Container _getGradient() {
  return Container(
    margin: EdgeInsets.only(top: 190.0),
    height: 110.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
        stops: [0.0, 0.9],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      ),
    ),
  );
}

Widget _getContent(Planet planet) {
  final _overviewTitle = "Overview".toUpperCase();
  return new ListView(
    padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: <Widget>[
      PlanetSummary(
        planet,
        horizontal: false,
      ),
      Container(
        padding: new EdgeInsets.symmetric(horizontal: 32.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              _overviewTitle,
              style: headerTextStyle(),
            ),
            Separator(),
            Text(planet.description),
          ],
        ),
      ),
    ],
  );
}

Container _getToolbar(BuildContext context) {
  return new Container(
    margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: new BackButton(color: Colors.white),
  );
}

/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(planet.name),
Hero(
tag: "planet-hero-${planet.id}",
child: Image.asset(
planet.image,
width: 96.0,
height: 96.0,
),
)
],
),*/
