import 'package:flutter/material.dart';
import 'package:praum_project_web_app/mobile.dart';
import 'package:praum_project_web_app/wep.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MaterialApp(
    title: "Stream App",
    debugShowCheckedModeBanner: false,
    home: ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MyAppMobile(),
      tablet: (BuildContext context) => MyAppMobile(),
      desktop: (BuildContext context) => MyAppWeb(),
    ),
  ));
}
