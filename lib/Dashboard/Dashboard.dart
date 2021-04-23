import 'package:flutter/material.dart';
import 'package:praum_project_web_app/Dashboard/src/streamDataCards.dart';
import 'package:praum_project_web_app/Dashboard/src/streamTable/streamstate.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xffe8edf3),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Add Stream',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF304074)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: StreamDataCard(
                    label: "Total Stream",
                    numbers: 99,
                    statu: Icons.offline_pin_rounded,
                    statuColor: Color(0xFF304074),
                  )),
                  Expanded(
                    child: StreamDataCard(
                      label: "Online",
                      numbers: 99,
                      statu: Icons.album_outlined,
                      statuColor: Colors.green,
                    )
                  ),
                  Expanded(
                    child: StreamDataCard(
                      label: "Offline",
                      numbers: 99,
                      statu: Icons.album_outlined,
                      statuColor: Color(0xFF9a9a9a),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Stream Backup',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF8b8b8b),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                          size: 10,
                        ),
                        label: Text(
                          'Add Stream',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF8b8b8b)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Start All',
                            style: TextStyle(color: Colors.green, fontSize: 10),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffe8edf3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Stop All',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: StreamState())
          ],
        ),
      ),
    );
  }
}
