import 'package:amal_assignment_01/ui/widgets/button_primary_widget.dart';
import 'package:amal_assignment_01/ui/widgets/logo_widget.dart';
import 'package:amal_assignment_01/utils/data/Constants.dart';
import 'package:amal_assignment_01/utils/helper/NavigationHelper.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:amal_assignment_01/ui/widgets/my_text_field_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  LogoWidget(),
                  MyTextFormField(
                    TextInputType.emailAddress,
                    Constants.USER_EMAIL,
                    Icon(Icons.email_outlined),
                    (value) {
                      this._email = value;
                    },
                  ),
                  MyTextFormField(
                      TextInputType.visiblePassword,
                      Constants.USER_PASSWORD,
                      Icon(Icons.lock_outline), (value) {
                    this._password = value;
                  }),
                  Text(
                    'Forgot Password',
                  ),
                  ButtonPrimary("Login", () {
                    LoginUser();
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account?'),
                      TextButton(
                        child: Text("Create account"),
                        onPressed: () {
                          NavigationService.navigationService
                              .navigatorTo(Constants.ROUTE_PAGE_REGISTER);
                        },
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    ));
  }

  LoginUser() {
    bool isValidate = formKey.currentState.validate();
    if (isValidate) {
      // formKey.currentState.save();
      String s_email = SpHelper.spHelper.getStringValue(Constants.USER_EMAIL);
      String s_password =
          SpHelper.spHelper.getStringValue(Constants.USER_PASSWORD);

      print("input: $s_email $s_password");

      if (_email == s_email && _password == s_password) {
        SpHelper.spHelper.setBoolValue(Constants.IS_USER_LOGIN, true);

        final snackBar = SnackBar(content: Text('Login Success'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        NavigationService.navigationService
            .navigatorReplacemnt(Constants.ROUTE_PAGE_HOME);
      } else {
        final snackBar = SnackBar(content: Text('Wrong!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Wrong email or password");
      }
    }
    // else {
    //   final snackBar = SnackBar(content: Text('Wrong!'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   print("Wrong email or password");
    // }
  }
}
