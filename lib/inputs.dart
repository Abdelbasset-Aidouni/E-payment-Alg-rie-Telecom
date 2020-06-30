import 'package:flutter/material.dart';
import './colors.dart';
import 'package:validators/validators.dart';

String isPhone(input) {
  if (matches(input, r'^(00213|+213|0)(5|6|7)[0-9]{8}$')) {
    return null;
  }
  return "SVP entrez un numero valide";
}

String ccpValidator(input) {
  if (isNumeric(input) && input.length <= 10) return null;
  return "SVP entrez un Code CCP Valide";
}

String cleValidator(input) {
  if (isNumeric(input) && input.length <= 2) return null;
  return "SVP entrez un Clé Valide";
}

String emailValidator(input) {
  if (isEmail(input)) return null;
  return "SVP entrez une address email valide";
}

String notEmptyValidator(input) {
  if (input == null || input.length == 0) return "field cant be empty";
  return null;
}

String msisdnValidator(input) {
  if (input == null || input.length < 14 || !isNumeric(input))
    return "SVP entrez un MSISDN valide";
  return null;
}

class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final Function validator;
  const TextArea({Key key, this.hint, this.label, this.validator})
      : super(key: key);

  static const CCP = ccpValidator;
  static const PHONE = isPhone;
  static const EMAIL = emailValidator;
  static const NOT_EMPTY = notEmptyValidator;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: TextFormField(
          maxLines: null,
          minLines: 5,
          keyboardType: TextInputType.multiline,
          validator: this.validator == null ? null : this.validator,
          decoration: InputDecoration(
            // border: InputBorder.none,
            hintText: this.hint,
            labelText: this.label,
            labelStyle: labelTextStyle,
          ),
        ));
  }
}

class CustomTextInput extends StatelessWidget {
  final String hint;
  final String label;
  final Function validator;
  const CustomTextInput({Key key, this.hint, this.label, this.validator})
      : super(key: key);

  static const CCP = ccpValidator;
  static const CLE = cleValidator;
  static const PHONE = isPhone;
  static const EMAIL = emailValidator;
  static const NOT_EMPTY = notEmptyValidator;
  static const MSISDN = msisdnValidator;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: TextFormField(
          validator: this.validator == null ? null : this.validator,
          decoration: InputDecoration(
            // border: InputBorder.none,
            hintText: this.hint,
            labelText: this.label,
            labelStyle: labelTextStyle,
          ),
        ));
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
        child: DropdownButton<String>(
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
