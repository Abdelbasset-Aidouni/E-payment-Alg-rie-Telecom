import 'package:e_payment/inputs.dart';
import 'package:e_payment/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './drawer.dart';
import './buttons.dart';
import './colors.dart';

class ContactUsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  ContactUsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Contacter Nous"),
        ),
        resizeToAvoidBottomInset: false,
        drawer: CustomDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            Container(
                height: 200,
                child: Center(
                  child: SvgPicture.asset("assets/icons/logo_blue.svg",
                      width: 200, height: 100),
                )),
            SizedBox(height: 10),
            Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CustomTextInput(
                        hint: "entrer votre address email",
                        label: "Email",
                        validator: CustomTextInput.EMAIL,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextArea(
                        hint: "Ecrire votre message ici ...",
                        label: "Votre Message",
                        validator: TextArea.NOT_EMPTY,
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonPrimary(
                              type: ButtonPrimary.LG,
                              text: "Envoyer",
                              onTapHandler: () {
                                if (_formKey.currentState.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button for close dialog!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                          'Votre Message a été envoyée avec succée',
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OffersPage()),
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
                              type: ButtonOutlinePrimary.LG,
                              text: "Annuler",
                              onTapHandler: () {
                                Navigator.pop(context);
                              },
                            )
                          ])
                    ],
                  ),
                ))
          ]),
        ));
  }
}
