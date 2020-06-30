import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './buttons.dart';
import './colors.dart';
import './drawer.dart';



class FactureLine extends StatelessWidget {
  static const SUCCESS = 1;
  static const FAILED = 2;
  static const PENDING = 3;
  final String numeroFacture;
  final String total;
  final String date;
  final int status;
  
  const FactureLine({Key key, this.numeroFacture, this.total, this.date, this.status}) : super(key: key);
  
  static const Map<int,String> STATUS = {
    FactureLine.SUCCESS:"Succés",
    FactureLine.FAILED:"echouée",
    FactureLine.PENDING:"en attente",
  };
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 3,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        ) ,
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical:12.0),
        child:Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text("Facture N° " + this.numeroFacture,style: alternateSecondaryTextStyle,),
              Text(this.total + " DA",style:alternateSecondaryTextStyle600)
            ],),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(this.date,style: secondaryTextStyle,),
              Text(
                FactureLine.STATUS[status],
                style: this.status == FactureLine.SUCCESS ?
                successTextStyle700 :
                this.status == FactureLine.PENDING ?
                warningTextStyle700 :
                dangerTextStyle700,
              )
            ],)
          ],
        )
      )
    );
  }
}


class TotalCard extends StatelessWidget {
  final String title;
  final String value;
  const TotalCard({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
          child: Card(
            color: Colors.white,
        elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Text(this.title,style: secondaryTextStyle,softWrap: true,textAlign: TextAlign.center,),
                        SizedBox(height:10),
                        Text(this.value,style: secondaryTextStyle700,)
                      ],
                      ),
                  ),
                ),
    );
  }
}





class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("E-payment Espace Client"),
      ),
      
      drawer: CustomDrawer(),
      body:Container(
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TotalCard(
                title: "Rechargement total",
                value: "14380 DA",
              ),
              TotalCard(
                title: "Dernier Rechargement",
                value: "08/11/2020",
              ),
              
          ],),
          SizedBox(height:40),
          Align(
            alignment: Alignment.topLeft,
            child:Text("Historique des payments ",style:basePrimaryTextStyle),
          ),
          SizedBox(height:10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            primary: true,
            child:ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: ListView(
                children: <Widget>[
                FactureLine(
              numeroFacture: "578653",
              total: "2900",
              date:"20 Avril ,2020",
              status: FactureLine.SUCCESS,
          ),
          FactureLine(
              numeroFacture: "578653",
              total: "1000",
              date:"20 Avril ,2020",
              status: FactureLine.FAILED,
          ),
          FactureLine(
              numeroFacture: "01283",
              total: "4930",
              date:"20 Avril ,2020",
              status: FactureLine.SUCCESS,
          ),
          FactureLine(
              numeroFacture: "98239",
              total: "3900",
              date:"20 Avril ,2020",
              status: FactureLine.PENDING,
          ),
          FactureLine(
              numeroFacture: "98239",
              total: "3900",
              date:"20 Avril ,2020",
              status: FactureLine.PENDING,
          ),
          FactureLine(
              numeroFacture: "98239",
              total: "3900",
              date:"20 Avril ,2020",
              status: FactureLine.PENDING,
          )
              ],),
            )
          )
          
          ]
        ),
      ),
      
    );
  }
}