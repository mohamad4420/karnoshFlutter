class SerModel {
  List<String> server = [""];
  List<String> nameServer = [""];
  SerModel(this.server);
  SerModel.fromJson(Map<String, dynamic> map) {
    (map['server'] as List).map((data) {
      this.server.add(data);
    }).toList();
  }
}
