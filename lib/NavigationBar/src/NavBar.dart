import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:praum_project_web_app/NavigationBar/src/NavBarItem.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<bool> selected = [true, false, false];

  void select(int n) {
    for (int i = 0; i < 3; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          NavBarItem(
            label: "Stream",
            icon: Feather.radio,
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
              });
            },
          ),
          NavBarItem(
            label: "User Manage",
            icon: Icons.account_circle_outlined,
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
              });
            },
          ),
          NavBarItem(
            label: "Viewer Manage",
            icon: Icons.view_carousel,
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
        ],
      ),
    );
  }
}
