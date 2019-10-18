import 'package:flutter/material.dart';
import 'package:planets_flutter/model/Planet.dart';
import 'PlanetRow.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => PlanetRow(planets[index]),
        itemCount: planets.length,
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}
