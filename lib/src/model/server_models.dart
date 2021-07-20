class SerModel {
  List<String> server = [""];
  SerModel(this.server);
  SerModel.fromJson(Map<String, dynamic> map) {
    // print(map['server']);
    (map['server'] as List).map((i) => this.server.add(i)).toList();
  }
}
