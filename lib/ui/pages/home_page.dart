import 'package:amal_assignment_01/ui/widgets/button_primary_24_widget.dart';
import 'package:amal_assignment_01/ui/widgets/logo_widget.dart';
import 'package:amal_assignment_01/utils/data/Constants.dart';
import 'package:amal_assignment_01/utils/helper/NavigationHelper.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String welcomeMsg = "Welcome";

  @override
  Widget build(BuildContext context) {
    String name = SpHelper.spHelper.getStringValue(Constants.USER_NAME);

    welcomeMsg = "Welcom $name";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LogoWidget(),
            Text(
              welcomeMsg,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            ButtonPrimary("Logout", () {
              SpHelper.spHelper.clearSharedPref();
              NavigationService.navigationService
                  .navigatorReplacemnt(Constants.ROUTE_PAGE_LOGIN);
            }),
          ],
        ),
      ),
    );
  }
}
