class MyData {
  String previous;
  String next;
  List<Results> results;

  MyData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  int SI;
  String name;
  String logo;
  String Group;
  bool Status;
  bool Action;

  Results.fromJson(Map<String, dynamic> json) {
    SI = json['SI'];
    name = json['name'];
    logo = json['logo'];
    Group = json['Group'];
    Status = json['Status'];
    Action = json['Action'];
  }
}
