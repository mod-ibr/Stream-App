import 'package:flutter/material.dart';

class ApplicationName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Center(
        child:Align(
          alignment: Alignment.centerLeft,
          child: Image.asset("assets/image.png"),)
      ),
    );
  }
}