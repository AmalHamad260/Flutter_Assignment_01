import 'package:amal_assignment_01/ui/widgets/button_primary_24_widget.dart';
import 'package:amal_assignment_01/utils/data/Constants.dart';
import 'package:amal_assignment_01/utils/helper/NavigationHelper.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:amal_assignment_01/ui/widgets/my_text_field_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                MyTextFormField(TextInputType.text, Constants.USER_NAME,
                    Icon(Icons.person_outline), (value) {}),
                MyTextFormField(TextInputType.number, Constants.USER_MOBILE,
                    Icon(Icons.mobile_friendly), (value) {}),
                MyTextFormField(
                    TextInputType.emailAddress,
                    Constants.USER_EMAIL,
                    Icon(Icons.email_outlined),
                    (value) {}),
                MyTextFormField(
                    TextInputType.visiblePassword,
                    Constants.USER_PASSWORD,
                    Icon(Icons.lock_outline),
                    (value) {}),
                ButtonPrimary("Register", () {
                  saveFormRegister();
                }),
              ],
            ),
          )),
    );
  }

  saveFormRegister() {
    bool isValidate = formKey.currentState.validate();
    if (isValidate) {
      formKey.currentState.save();

      SpHelper.spHelper.setBoolValue(Constants.IS_USER_LOGIN, true);

      final snackBar = SnackBar(content: Text('Account Created'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      NavigationService.navigationService
          .navigatorReplacemnt(Constants.ROUTE_PAGE_HOME);
    } else {
      print("error");
    }
  }
}
