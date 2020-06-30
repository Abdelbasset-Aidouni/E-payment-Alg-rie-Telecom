import 'package:flutter/material.dart';
import './colors.dart';


class CustomTextInput extends StatelessWidget {
  
  const CustomTextInput({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            
            child: TextFormField(
              decoration: InputDecoration(
              // border: InputBorder.none,
              hintText: 'entrer votre MSISDN',
              labelText: 'MSISDN',
              labelStyle: labelTextStyle,


            ),
            )
        );
  }
}

class CustomSelectField extends StatefulWidget {
  CustomSelectField({Key key}) : super(key: key);

  @override
  _CustomSelectFieldState createState() => _CustomSelectFieldState();
}

class _CustomSelectFieldState extends State<CustomSelectField> {
  String dropdownValue = "1000 DA";
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
    constraints: const BoxConstraints(minWidth: double.infinity),
    child:DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      itemHeight: 80.0,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['500 DA', '1000 DA', '1500 DA', '2000 DA']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ));
  }
}