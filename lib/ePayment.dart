import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './colors.dart';
import './drawer.dart';
import './buttons.dart';
import './inputs.dart';
import 'successPage.dart';

class ConfirmDialog extends StatelessWidget {
  final Function validateForm;
  final _formKey = GlobalKey<FormState>();
  ConfirmDialog({Key key, this.validateForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Form(
        key: _formKey,
        child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxHeight: 400, minHeight: 350),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(
                  alignment: Alignment.center,
                  child: Text("Baridi Mob", style: titlePrimaryTextStyle)),
              SizedBox(height: 10),
              CustomTextInput(
                validator: CustomTextInput.CCP,
                hint: 'entrer votre Code CCP',
                label: 'CCP',
              ),
              SizedBox(height: 20),
              CustomTextInput(
                validator: CustomTextInput.CLE,
                hint: 'entrer le clé de votre Compte CCP',
                label: 'Clé',
              ),
              SizedBox(height: 50),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ButtonPrimary(
                  type: ButtonPrimary.MD,
                  text: "Confirmer",
                  onTapHandler: () {
                    if (_formKey.currentState.validate()) {
                      this.validateForm();
                      Navigator.pop(context);
                    }
                  },
                ),
                ButtonOutlinePrimary(
                  type: ButtonOutlinePrimary.MD,
                  text: "Annuler",
                  onTapHandler: () {
                    Navigator.pop(context);
                  },
                )
              ])
            ])),
      ),
    );
  }
}

class EPaymentPage extends StatelessWidget {
  final String title;
  const EPaymentPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Paiement Eléctronique"),
      ),
      resizeToAvoidBottomInset: false,
      drawer: CustomDrawer(),
      body: EPaymentBody(
        title: this.title,
      ),
    );
  }
}

class EPaymentBody extends StatefulWidget {
  final String title;
  const EPaymentBody({Key key, this.title}) : super(key: key);

  @override
  _EPaymentBodyState createState() => _EPaymentBodyState();
}

class _EPaymentBodyState extends State<EPaymentBody> {
  bool _accepted = true;
  bool baridi_mob_selected = true;
  bool alg_poste_selected = false;
  bool form_valid = false;

  setFormIsValide() {
    setState(() {
      this.form_valid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Align(
                alignment: Alignment.center,
                child: Text(widget.title, style: titlePrimaryTextStyle)),
            SizedBox(height: 10),
            CustomSelectField(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomIconButton(
                  icon: "assets/icons/baridi_mob.png",
                  selected: baridi_mob_selected,
                  onTapHandler: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => ConfirmDialog(
                          validateForm: this.setFormIsValide,
                        ),
                      );
                      if (!this.baridi_mob_selected) {
                        this.baridi_mob_selected = !this.baridi_mob_selected;
                        this.alg_poste_selected = !this.alg_poste_selected;
                      }
                    });
                  },
                ),
                CustomIconButton(
                  icon: "assets/icons/alg_post.png",
                  selected: alg_poste_selected,
                  onTapHandler: () {
                    setState(() {
                      if (!this.alg_poste_selected) {
                        this.alg_poste_selected = !this.alg_poste_selected;
                        this.baridi_mob_selected = !this.baridi_mob_selected;
                      }
                    });
                  },
                )
              ],
            )
          ]),
        ),

        SizedBox(height: 20),

        //Paiment Electronique

        Container(
          alignment: Alignment.topLeft,
          constraints: const BoxConstraints(minWidth: double.infinity),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  if (this.form_valid)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessPage()),
                    );
                  else
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Informations Invalide'),
                          content: const Text(
                              'SVP verifier vos informations et ressayer !'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
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
    );
  }
}
