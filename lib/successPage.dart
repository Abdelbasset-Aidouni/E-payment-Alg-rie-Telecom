import 'package:flutter/material.dart';
import './buttons.dart';
import './colors.dart';
import './drawer.dart';
import './offers.dart';
import 'package:flutter_svg/svg.dart';

class FactureDetailLine extends StatelessWidget {
  final String label;
  final String value;
  const FactureDetailLine({Key key, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(this.label, style: darkSecondaryTextStyle700),
          Text(this.value, style: darkSecondaryTextStyle700)
        ],
      ),
    );
  }
}

class FactureDetailDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  FactureDetailDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxHeight: 350, minHeight: 250),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Align(
                alignment: Alignment.center,
                child:
                    Text("Facture de recharge", style: titlePrimaryTextStyle)),
            SizedBox(height: 10),
            FactureDetailLine(
              label: "Numero de facture:",
              value: "N°5555",
            ),
            FactureDetailLine(
              label: "Numero du client:",
              value: "032453235",
            ),
            FactureDetailLine(
              label: "Montant:",
              value: "1000 DA",
            ),
            FactureDetailLine(
              label: "Date:",
              value: "12/05/2020",
            ),
            FactureDetailLine(
              label: "Temps:",
              value: "20:43",
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ButtonPrimary(
                type: ButtonPrimary.MD,
                text: "OK",
                onTapHandler: () {
                  Navigator.pop(context);
                },
              ),
            ])
          ])),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);

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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            Container(
                height: 220,
                child: Center(
                  child: SvgPicture.asset("assets/icons/idoom.svg",
                      width: 200, height: 50),
                )),
            Center(
              child: Text(
                "Idoom Internet",
                style: titlePrimaryTextStyle,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 200,
                child: Center(
                  child: SvgPicture.asset("assets/icons/success.svg",
                      width: 160, height: 160),
                )),
            Center(
              child: Text(
                "Rechargement avec succés",
                style: titleSuccessTextStyle,
              ),
            ),
            SizedBox(height: 60),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ButtonPrimary(
                text: "Page d'accueil",
                onTapHandler: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OffersPage()),
                  );
                },
              ),
              ButtonOutlinePrimary(
                text: "Afficher la Facture",
                onTapHandler: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => FactureDetailDialog(),
                  );
                },
              )
            ])
          ])),
    );
  }
}
