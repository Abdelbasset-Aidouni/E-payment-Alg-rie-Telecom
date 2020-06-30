import 'package:flutter/material.dart';
import './colors.dart';







class ButtonPrimaryLarge extends StatelessWidget {
  final String text;
  final Function onTapHandler;
  const ButtonPrimaryLarge({Key key, this.text,this.onTapHandler}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            
            child: FlatButton(
            
            padding: EdgeInsets.symmetric(vertical:12.0 ,horizontal: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: blueColor,
            child: Container(
              alignment: Alignment.topLeft,
              child:Text(this.text,style:buttonWhiteTextStyle),
            ),
            
            onPressed: this.onTapHandler, 
          ),
        );
  }
}



class ButtonOutlinePrimary extends StatelessWidget {
  final String text;
  final Function onTapHandler;
  const ButtonOutlinePrimary({Key key, this.text,this.onTapHandler}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  ButtonTheme(
          minWidth: 160,
          child: OutlineButton(
              borderSide: BorderSide(color: blueColor,width: 2.0),
              padding: EdgeInsets.symmetric(vertical:8.0 ,horizontal: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),

              ),
              color: blueColor,
              child: Container(
                alignment: Alignment.topLeft,
                child:Text(this.text,style:buttonPrimaryTextStyle),
              ),
              
              onPressed: this.onTapHandler, 

          ),
    );
  }
}


class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function onTapHandler;
  const ButtonPrimary({Key key, this.text,this.onTapHandler}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  ButtonTheme(
          minWidth: 160,
          child: FlatButton(
              
              padding: EdgeInsets.symmetric(vertical:8.0 ,horizontal: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: blueColor,
              child: Container(
                alignment: Alignment.topLeft,
                child:Text(this.text,style:buttonWhiteTextStyle),
              ),
              
              onPressed: this.onTapHandler, 

          ),
    );
  }
}




class CustomIconButton extends StatelessWidget {
  final String icon;
  final Function onTapHandler;
  final bool selected;
  const CustomIconButton({Key key, this.icon, this.onTapHandler, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
               side: selected ?  BorderSide(color: blueColor,width: 2) : BorderSide(color: Colors.transparent,width: 0)  ,
            ),
                    child:IconButton(
                    iconSize: 70,
                    icon: Image.asset(this.icon,width:160,height:160), 
                    onPressed: this.onTapHandler
                    )
                  );
  }
}