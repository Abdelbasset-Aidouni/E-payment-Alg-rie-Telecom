import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './DrawerHeader.dart';
import './offers.dart';
import './paymentHistory.dart';




class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF53A0ED),
              ),
              child: Container(
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end ,
                      children: [
                        GestureDetector(
                          child:SvgPicture.asset("assets/back_arrow.svg",width:30,height:30),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                        
                      ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/logo.svg",width:150,height:70)
                        ],
                      )
                  ]
                ),
              ),
              
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/grid.svg",width:30,height:30),
              title: Text('Page Principale'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffersPage()),
                  );
              },
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/inbox.svg",width:30,height:30,color: Color(0xFF6A6A6A),),
              title: Text('Historique de paiement'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentHistoryPage()),
                  );
              },
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/plus.svg",width:30,height:30),
              title: Text("Plus d'information "),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/promos.svg",width:30,height:30),
              title: Text("À propos"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/forums.svg",width:30,height:30),
              title: Text("Contacter Nous"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset("assets/icons/spam.svg",width:30,height:30),
              title: Text("Signaler un Problem"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}