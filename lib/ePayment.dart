import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './colors.dart';
import './drawer.dart';
import './buttons.dart';
import './inputs.dart';







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
      resizeToAvoidBottomInset:false,
      drawer: CustomDrawer(),
      body:EPaymentBody(title: this.title,),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Container(
            height: 250,
            child:Center(
              child: SvgPicture.asset("assets/icons/idoom.svg",width:200,height:50) ,
              )
          ),

          SizedBox(height:10),

          //Cartes et Tickets
          Container(
            alignment: Alignment.topLeft,
            constraints: const BoxConstraints(minWidth: double.infinity),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children:[
                Align(
                  alignment: Alignment.center,
                  child:Text(widget.title,style:titlePrimaryTextStyle)
                )
                ,
                SizedBox(height:10),
                CustomSelectField(),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomIconButton(
                      icon:"assets/icons/baridi_mob.png",
                      selected: baridi_mob_selected,
                      onTapHandler: (){
                        setState(() {
                          if (!this.baridi_mob_selected){
                            this.baridi_mob_selected = !this.baridi_mob_selected;
                          this.alg_poste_selected = !this.alg_poste_selected;
                          }
                          
                        });
                      },
                    ),
                    CustomIconButton(
                      icon:"assets/icons/alg_post.png",
                      selected: alg_poste_selected,
                      onTapHandler: (){
                        setState(() {
                          if (!this.alg_poste_selected){
                            this.alg_poste_selected = !this.alg_poste_selected;
                          this.baridi_mob_selected = !this.baridi_mob_selected;

                          }
                          
                        });
                      },
                    )
                  
                
                  
                ],)
                
                
              ]
            ),
          ),

          SizedBox(height:20),

          //Paiment Electronique

          Container(
            alignment: Alignment.topLeft,
            constraints: const BoxConstraints(minWidth: double.infinity),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children:[
                Row(
                  children: <Widget>[
                    Checkbox(
                    value: _accepted, 
                    onChanged: (value) {
                      setState(() {
                        this._accepted = value;
                      });
                    }
                  ),
                  Text(
                    "J'accepte les conditions générales d'utilisation",
                    style:infoTextStyle,
                  )
                  ],
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    ButtonPrimary(text: "Confirmer",onTapHandler: (){},),
                    ButtonOutlinePrimary(text: "Annuler",onTapHandler: (){},)
                  ]
                )
                
                
              ]
            ),
          )
        ]
      ),
    );
  }
}