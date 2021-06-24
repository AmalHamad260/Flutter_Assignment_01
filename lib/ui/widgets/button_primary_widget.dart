import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  String text;
  Function onClick;

  ButtonPrimary(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // style: ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12), // <-- Radius
        //   ),
        // ),
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}
