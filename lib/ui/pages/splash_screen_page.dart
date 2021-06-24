import 'package:amal_assignment_01/ui/widgets/logo_widget.dart';
import 'package:amal_assignment_01/utils/data/Constants.dart';
import 'package:amal_assignment_01/utils/helper/NavigationHelper.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    bool isLogged = SpHelper.spHelper.getBoolValue(Constants.IS_USER_LOGIN);
    Future.delayed(Duration(seconds: 3), () {
      if (isLogged) {
        NavigationService.navigationService
            .navigatorReplacemnt(Constants.ROUTE_PAGE_HOME);
      } else {
        NavigationService.navigationService
            .navigatorReplacemnt(Constants.ROUTE_PAGE_LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LogoWidget()),
    );
  }
}
