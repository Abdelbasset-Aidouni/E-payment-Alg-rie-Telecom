import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './colors.dart';
import './drawer.dart';
import './carteTickets.dart';
import './ePayment.dart';
import './buttons.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("E-payment Espace Client"),
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: Column(children: [
            Container(
                height: 250,
                child: Center(
                  child: SvgPicture.asset("assets/icons/idoom.svg",
                      width: 200, height: 50),
                )),

            SizedBox(height: 10),

            //Cartes et Tickets
            Container(
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(minWidth: double.infinity),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Cartes et tickets ",
                        style: basePrimaryTextStyle)),
                SizedBox(height: 10),
                ButtonPrimaryLarge(
                  text: "Idoom Internet",
                  onTapHandler: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartesTicketsPage(
                                title: "Idoom Internet",
                              )),
                    );
                  },
                ),
                SizedBox(height: 10),
                ButtonPrimaryLarge(
                  text: "Idoom 4G",
                  onTapHandler: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartesTicketsPage(
                                title: "Idoom 4G",
                              )),
                    );
                  },
                ),
              ]),
            ),

            SizedBox(height: 40),

            //Paiment Electronique

            Container(
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(minWidth: double.infinity),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Paiement Eléctronique ",
                        style: basePrimaryTextStyle)),
                SizedBox(height: 10),
                ButtonPrimaryLarge(
                  text: "Paiement des factures",
                  onTapHandler: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EPaymentPage(
                                title: "Paiement des factures",
                              )),
                    );
                  },
                ),
                SizedBox(height: 10),
                ButtonPrimaryLarge(
                  text: "Idoom Internet",
                  onTapHandler: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EPaymentPage(
                                title: "Idoom Internet",
                              )),
                    );
                  },
                ),
                SizedBox(height: 10),
                ButtonPrimaryLarge(
                  text: "Idoom 4G",
                  onTapHandler: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EPaymentPage(
                                title: "Idoom 4G",
                              )),
                    );
                  },
                ),
              ]),
            )
          ]),
        ));
  }
}
