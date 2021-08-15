class SerModel {
  List<String> server = [""];
  List<String> nameServer = [""];
  SerModel(this.server);
  SerModel.fromJson(Map<String, dynamic> map) {
    (map['server'][0] as List).map((data) {
      String name = data;
      if (name.contains(",")) {
        name = name.split(",")[1];
      } else {
        name = name.replaceAll("www.", "");
        name = name.split("//")[1].split(".")[0];
      }
      this.nameServer.add(name);
      this.server.add(data);
    }).toList();
  }
}
