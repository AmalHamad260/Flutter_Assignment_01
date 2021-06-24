import 'package:amal_assignment_01/interfaces/OnTextFialdListener.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class MyTextFormField extends StatelessWidget {
  String inputValue = "";
  String fieldHint = "";
  // MyFormFiledType inputType;
  TextInputType inputType;
  Icon icon;
  // OnTextFialdListener listener;
  Function(String) getText;

  MyTextFormField(this.inputType, this.fieldHint, this.icon, this.getText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: this.inputType,
        validator: (value) {
          this.inputValue = value;
          // if (mListener != null) {
          getText(value);
          // }
          return validateField(value);
        },
        onSaved: (newValue) {
          SpHelper.spHelper.sharedPreferences.setString(fieldHint, newValue);
        },
        decoration: InputDecoration(
            labelText: this.fieldHint,
            suffix: this.icon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

  String validateField(String value) {
    if (value.length == 0 || value == null) {
      return '* Required Field';
    }

    if (inputType == TextInputType.emailAddress && !isEmail(value)) {
      return '* Incorrect Email';
    }

    if (inputType == TextInputType.number && !isNumeric(value)) {
      return '* Incorrect Mobile Number';
    }

    if (inputType == TextInputType.visiblePassword && value.length < 6) {
      return '* Password length < 6';
    }
  }
}
