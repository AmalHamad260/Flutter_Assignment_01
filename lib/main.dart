import 'package:amal_assignment_01/ui/pages/home_page.dart';
import 'package:amal_assignment_01/utils/data/Constants.dart';
import 'package:amal_assignment_01/utils/helper/NavigationHelper.dart';
import 'package:amal_assignment_01/ui/pages/error_page.dart';
import 'package:amal_assignment_01/ui/pages/login_page.dart';
import 'package:amal_assignment_01/ui/pages/register_page.dart';
import 'package:amal_assignment_01/ui/pages/splash_screen_page.dart';
import 'package:amal_assignment_01/utils/helper/SharedPrefHelper.dart';
import 'package:flutter/material.dart';

void main() async {
  //initSharedPrefernces
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefernces();

  //App Pages Route
  runApp(MaterialApp(
    navigatorKey: NavigationService.navigatorKey,
    home: SplashScreenPage(),
    routes: {
      // '/': (context) => SplashScreenPage(),
      Constants.ROUTE_PAGE_SPLASH: (context) => SplashScreenPage(),
      Constants.ROUTE_PAGE_LOGIN: (context) => LoginPage(),
      Constants.ROUTE_PAGE_REGISTER: (context) => RegisterPage(),
      Constants.ROUTE_PAGE_HOME: (context) => HomePage(),
    },
    // onGenerateRoute: (RouteSettings routeSettings) {
    //   String routeName = routeSettings.name;
    //   // var arguments = routeSettings.arguments;

    //   switch (routeName) {
    //     case ('login_page'):
    //       return MaterialPageRoute(builder: (context) {
    //         // return LoginPage(arguments);
    //         return LoginPage();
    //       });
    //       break;
    //     case ('register_page'):
    //       return MaterialPageRoute(builder: (context) {
    //         return RegisterPage();
    //       });
    //       break;
    //     default:
    //       return MaterialPageRoute(builder: (context) {
    //         return ErrorPage();
    //       });
    //   }
    // },
    // onUnknownRoute: (RouteSettings routesettings) {
    //   return MaterialPageRoute(builder: (context) {
    //     return ErrorPage();
    //   });
    // },
  ));
}
