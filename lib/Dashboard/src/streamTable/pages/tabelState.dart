import 'package:flutter/material.dart';
import 'package:praum_project_web_app/Dashboard/src/streamTable/provider/tableWidgetProvider.dart';
import 'package:provider/provider.dart';

class TabelState extends StatefulWidget {
  @override
  _TabelStateState createState() => _TabelStateState();
}

class _TabelStateState extends State<TabelState> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableWidgetProvider>(
      create: (context) => TableWidgetProvider(),
      child: Consumer<TableWidgetProvider>(
        builder: (context, provider, child) {
          var rowHeight = (MediaQuery.of(context).size.height - 50);
          if (provider.data == null) {
            provider.getData(context);
            return Center(child: CircularProgressIndicator());
          }
          // when we have the json loaded... let's put the data into a data table widget

          return Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: MediaQuery.of(context).size.width / 19,
                  dataRowHeight: 40,
                  dataTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  columns: [
                    DataColumn(
                        label: Text('SI'), tooltip: 'represents the order'),
                    DataColumn(
                        label: Text('Name'),
                        tooltip: 'represents the name of the user'),
                    DataColumn(
                        label: Text('Logo'),
                        tooltip: 'represents the logo of the user'),
                    DataColumn(
                        label: Text('Group'),
                        tooltip: 'represents the grop of the user'),
                    DataColumn(
                        label: Text('Status'),
                        tooltip: 'represents the status of the user'),
                    DataColumn(
                        label: Text('Action'),
                        tooltip: 'represents the action of the user'),
                    DataColumn(label: SizedBox(), tooltip: "Edit"),
                    DataColumn(label: SizedBox(), tooltip: "Delete"),
                  ],
                  rows: provider.data.results
                      .map(
                        (data) =>
                            // we return a DataRow every time
                            DataRow(
                          // List<DataCell> cells is required in every row
                          cells: [
                            DataCell(
                              Text(data.SI.toString()),
                            ),
                            DataCell(
                              Text(data.name),
                            ),
                            DataCell(
                              Image(
                                height: 30,
                                width: 30,
                                image: AssetImage(data.logo),
                              ),
                            ),
                            DataCell(
                              Text(data.Group),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Text((data.Status)
                                      ? "Published"
                                      : "Unpublished"),
                                  Switch(
                                    value: data.Status,
                                    onChanged: (value) {
                                      setState(() {
                                        data.Status = value;
                                        print(data.Status);
                                      });
                                    },
                                    activeTrackColor: Color(0xff304074),
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  (data.Action) ? Icons.play_arrow : Icons.stop,
                                ),
                                color:
                                    (data.Action) ? Colors.green : Colors.red,
                                onPressed: () {
                                  setState(() {
                                    data.Action = !data.Action;
                                    print(data.Action);
                                  });
                                },
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    print("Edit");
                                  });
                                },
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.delete_outlined),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    print("Deleted");
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
