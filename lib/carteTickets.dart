import 'package:e_payment/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './colors.dart';
import './drawer.dart';
import './buttons.dart';
import './inputs.dart';

class CartesTicketsPage extends StatelessWidget {
  final String title;
  const CartesTicketsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Cartes et Tickets "),
      ),
      resizeToAvoidBottomInset: false,
      drawer: CustomDrawer(),
      body: CartesTicketsBody(
        title: this.title,
      ),
    );
  }
}

class CartesTicketsBody extends StatefulWidget {
  final String title;
  const CartesTicketsBody({Key key, this.title}) : super(key: key);

  @override
  _CartesTicketsBodyState createState() => _CartesTicketsBodyState();
}

class _CartesTicketsBodyState extends State<CartesTicketsBody> {
  bool _accepted = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
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
                  alignment: Alignment.center,
                  child: Text(widget.title, style: titlePrimaryTextStyle)),
              SizedBox(height: 10),
              CustomTextInput(
                hint: 'entrez votre MSISDN',
                label: 'MSISDN',
                validator: CustomTextInput.MSISDN,
              ),
              SizedBox(height: 10),
              CustomSelectField()
            ]),
          ),

          SizedBox(height: 20),

          //Paiment Electronique

          Container(
            alignment: Alignment.topLeft,
            constraints: const BoxConstraints(minWidth: double.infinity),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: <Widget>[
                  Checkbox(
                      value: _accepted,
                      onChanged: (value) {
                        setState(() {
                          this._accepted = value;
                        });
                      }),
                  Text(
                    "J'accepte les conditions générales d'utilisation",
                    style: infoTextStyle,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ButtonPrimary(
                  text: "Confirmer",
                  onTapHandler: () {
                    if (this._formKey.currentState.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Rechargement Effectuée'),
                            content: const Text(
                                'Votre Reachargement a été effectuée avec succès'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OffersPage()),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                ButtonOutlinePrimary(
                  text: "Annuler",
                  onTapHandler: () {},
                )
              ])
            ]),
          )
        ]),
      ),
    );
  }
}
