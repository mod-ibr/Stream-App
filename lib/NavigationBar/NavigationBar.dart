import 'package:flutter/material.dart';

import 'package:praum_project_web_app/NavigationBar/src/NavBar.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width/6,
        color: Color(0xff304074),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8,top: 8),
              height: 70.0,
              child: Center(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/image.png"),
              )),
            ),
            Align(
              alignment: Alignment.center,
              child: NavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
