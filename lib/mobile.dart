import 'package:flutter/material.dart';
import 'package:praum_project_web_app/Dashboard/src/streamTable/provider/tableWidgetProvider.dart';
import 'package:praum_project_web_app/Dashboard/streamDataCardsMobile.dart';
import 'package:clay_containers/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:provider/provider.dart';

class MyAppMobile extends StatefulWidget {
  @override
  _MyAppMobileState createState() => _MyAppMobileState();
}

class _MyAppMobileState extends State<MyAppMobile> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  static const List<Widget> _navbarPages = <Widget>[
    Text('Stream', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('User manager',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Viewer Manager',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigationBar(),
      body: Container(
        color: Color(0xfff7f7f9),
        // margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.only(top: 40),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 35,
                    ),
                    onPressed: () => print("More Button"),
                  )
                ],
              ),
            ),
            cards(),
            buttons(),
            searchBox(_searchController),
            StreamState(context)
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("Stream"),
          ),
          label: "",
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(
              Icons.online_prediction,
              color: Color(0xFF293364),
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("User"),
          ),
          label: "",
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(
              Icons.account_circle_outlined,
              color: Color(0xFF293364),
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("Viewer"),
          ),
          label: "",
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(
              Icons.view_carousel,
              color: Color(0xFF293364),
            ),
          ),
        ),
      ],
    );
  }

  Widget StreamState(context) {
    return ChangeNotifierProvider<TableWidgetProvider>(
      create: (context) => TableWidgetProvider(),
      child: Consumer<TableWidgetProvider>(builder: (context, provider, child) {
        if (provider.data == null) {
          provider.getData(context);
          return Center(child: CircularProgressIndicator());
        }
        // when we have the json loaded... let's put the data into a data table widget

        return Container(
            height: MediaQuery.of(context).size.height / (2.5),
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ListView(
              children: provider.data.results.map(
                (data) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Group: ${data.Group}",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Image.asset(data.logo,
                                          width: 50, height: 50),
                                      SizedBox(width: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.name,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  (data.Status)
                                                      ? "Published"
                                                      : "Unpublished",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Switch(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value: data.Status,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        data.Status = value;
                                                        print(data.Status);
                                                      });
                                                    },
                                                    activeTrackColor:
                                                        Colors.green,
                                                    activeColor: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: Icon(
                                        (data.Action)
                                            ? Icons.play_arrow
                                            : Icons.stop,
                                        size: 40,
                                      ),
                                      color: (data.Action)
                                          ? Colors.green
                                          : Color(0xFF304075),
                                      onPressed: () {
                                        setState(() {
                                          data.Action = !data.Action;
                                          print(data.Action);
                                        });
                                      })),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    print("Edit");
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    print("Deleted");
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ));
      }),
    );
  }
}

Widget cards() {
  return Container(
    height: 110,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 170,
          child: StreamDataCardMobile(
            label: "Total Stream",
            numbers: 99,
            statu: Icons.offline_pin_rounded,
            statuColor: Color(0xFF304074),
          ),
        ),
        Container(
          width: 170,
          child: StreamDataCardMobile(
            label: "Online",
            numbers: 99,
            statu: Icons.album_outlined,
            statuColor: Colors.green,
          ),
        ),
        Container(
          width: 170,
          child: StreamDataCardMobile(
            label: "Offline",
            numbers: 99,
            statu: Icons.album_outlined,
            statuColor: Color(0xFF9a9a9a),
          ),
        ),
      ],
    ),
  );
}

Widget buttons() {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Start All',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF9a59b5)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
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
              style: TextStyle(color: Color(0xFF9a59b5), fontSize: 10),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xffe8edf3),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xFF9a59b5)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget searchBox(var _searchController) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: TextField(
      controller: _searchController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 11),
        prefixIcon: Icon(
          Icons.search,
          size: 18,
          color: Color(0xFF4e5a89),
        ),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : InkWell(
                onTap: () => _searchController.clear(),
                child: Icon(
                  Icons.clear,
                  color: Color(0xFF4e5a89),
                ),
              ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Color(0xFF4e5a89)),
        ),
        border: OutlineInputBorder(
          borderSide: new BorderSide(width: 1, color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    ),
  );
}
