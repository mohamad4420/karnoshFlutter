class SerModel {
  List<String> server = [""];
  List<String> nameServer = [""];
  SerModel(this.server);
  SerModel.fromJson(Map<String, dynamic> map) {
    (map['server'] as List).map((data) {
      String name = data;
<<<<<<< HEAD
      name = name.replaceAll("www.", "");
      name = name.split("//")[1].split(".")[0];
      this.nameServer.add(name);
=======
      if (name.contains(','))
        this.nameServer.add(data.split(',')[1]);
      else
        this.nameServer.add(data.split('https://')[1].split('.')[0]);
>>>>>>> 0c2d44f737006db845c29c26270178aff21cf920
      this.server.add(data);
    }).toList();
  }
}
