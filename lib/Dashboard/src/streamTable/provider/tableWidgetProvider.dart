import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:praum_project_web_app/Dashboard/src/streamTable/model/myData.dart';

class TableWidgetProvider extends ChangeNotifier {
  MyData data;

  Future getData(context) async {

    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/raw/mJson.json');
    var mJson = json.decode(response);
    this.data = MyData.fromJson(mJson);
    this.notifyListeners();
  }
}
