import 'package:flutter/material.dart';
import 'package:praum_project_web_app/Dashboard/Dashboard.dart';
import 'package:praum_project_web_app/NavigationBar/NavigationBar.dart';
class MyAppWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            NavigationBar(),
            Expanded(flex: 2, child: DashBoard()),
            // CalendarSpace(),
          ],
        ),
      ),
    );
  }
}
