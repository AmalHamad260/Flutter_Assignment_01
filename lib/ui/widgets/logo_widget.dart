import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 120,
          ),
          Text(
            "Flutter",
            style: TextStyle(
                color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
