import 'package:flutter/material.dart';
import 'package:praum_project_web_app/Dashboard/src/streamTable/pages/tabelState.dart';

class StreamState extends StatefulWidget {
  @override
  _StreamStateState createState() => _StreamStateState();
}

class _StreamStateState extends State<StreamState> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var rowHeight = (MediaQuery.of(context).size.height / (3));
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFFf5f6fa),
              borderRadius: BorderRadius.circular(8),
            ),
            child: searchBar(),
          ),
          Container(
            child: TabelState(),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: 250,
            height: 35,
            decoration: new BoxDecoration(
                color: Colors.white,
                border: new Border.all(color: Colors.white),
                borderRadius: new BorderRadius.circular(50)),
            child: _searchBox()),
      ],
    );
  }

  Widget _searchBox() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 11),
        prefixIcon: Icon(
          Icons.search,
          size: 18,
        ),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : InkWell(
                onTap: () => _searchController.clear(),
                child: Icon(Icons.clear),
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: new BorderSide(width: 1, color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
