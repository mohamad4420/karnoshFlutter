class SerModel {
  List<String> server = [""];
  List<String> nameServer = [""];
  SerModel(this.server);
  SerModel.fromJson(Map<String, dynamic> map) {
    (map['server'] as List).map((data) {
      String name = data;
      if (name.contains(','))
        this.nameServer.add(data.split(',')[1]);
      else
        this.nameServer.add(data.split('https://')[1].split('.')[0]);
      this.server.add(data);
    }).toList();
  }
}
