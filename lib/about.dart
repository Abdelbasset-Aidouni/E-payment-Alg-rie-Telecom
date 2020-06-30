import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './buttons.dart';
import './drawer.dart';
import './colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("À propos"),
        ),
        drawer: CustomDrawer(),
        body: Stack(children: [
          Container(
              height: 250,
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset("assets/about.png",
                        fit: BoxFit.cover, width: double.infinity, height: 300),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 10,
                      child: SvgPicture.asset("assets/icons/idoom_white.svg",
                          width: 160, height: 40))
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 32.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "À propos",
                                style: titlePrimaryTextStyle,
                                textAlign: TextAlign.start,
                              )),
                          SizedBox(height: 20),
                          Text(
                            "IDOOM ADSL est une gamme d’offres Internet Haut Débit (ADSL) d’Algérie Télécom.Ces offres comportent des débits plus rapides, à prix réduit et en illimité.",
                            style: darkSecondaryLargeTextStyle600,
                          ),
                          SizedBox(height: 20),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Nos contacts",
                                style: titlePrimaryTextStyle,
                                textAlign: TextAlign.start,
                              )),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "ALGERIE TELECOM SPA",
                                        style: darkSecondaryLargeTextStyle,
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Siège Social : Route Nationale n°5,",
                                        style: darkSecondaryLargeTextStyle,
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Cinq Maisons, Mohammadia 16130 Alger",
                                        style: darkSecondaryLargeTextStyle,
                                      )),
                                  SizedBox(height: 20),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Tél: (213) 21 82.38.38",
                                        style: darkSecondaryLargeTextStyle600,
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "FAX: (213) 21 82.38.39",
                                        style: darkSecondaryLargeTextStyle600,
                                      )),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
