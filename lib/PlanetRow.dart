import 'package:flutter/material.dart';
import 'package:planets_flutter/detailPage.dart';
import 'package:planets_flutter/model/Planet.dart';

Container planetThumbnail(Planet planet) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: Hero(
      tag: "planet-hero-${planet.id}",
      child: Image(
        image: AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
    ),
  );
}

Container planetCard(Planet planet) {
  return Container(
    height: 124.0,
    margin: EdgeInsets.only(left: 46.0),
    decoration: BoxDecoration(
      color: Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
    child: planetCardContent(planet),
  );
}

Container planetCardContent(Planet planet) {
  return Container(
    margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: BoxConstraints.expand(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4.0),
        Text(
          planet.name,
          style: headerTextStyle(),
        ),
        SizedBox(height: 10.0),
        Text(
          planet.location,
          style: subHeaderTextStyle(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 0.0,
          width: 18.0,
          color: Color(0xff00c6ff),
        ),
        Row(
          children: <Widget>[
            Image.asset("assets/img/ic_distance.png", height: 12.0),
            SizedBox(width: 8.0),
            Text(
              planet.distance,
              style: regularTextStyle(),
            ),
            SizedBox(width: 24.0),
            Image.asset("assets/img/ic_gravity.png", height: 12.0),
            SizedBox(width: 8.0),
            Text(
              planet.gravity,
              style: regularTextStyle(),
            ),
          ],
        ),
      ],
    ),
  );
}

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailPage(planet),
        ),
      ),
      child: Container(
        height: 120.0,
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard(planet),
            planetThumbnail(planet),
          ],
        ),
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
