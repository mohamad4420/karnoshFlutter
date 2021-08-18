class GeneralData {
  String name;
  String date;
  String type;
  String poster;
  String description;
  String rating;
  String time;
  String galary;
  String broadcast;
  int numberOfServer;
  // ignore: non_constant_identifier_names
  String Rating;
  List<String> genres = [""];
  GeneralData(this.Rating, this.name, this.date, this.numberOfServer, this.type,
      this.description, this.poster, this.rating, this.genres);
  // get fucing

  GeneralData.fromJson(Map<String, dynamic> map) {
    if (map['Rating'] != null) {
      if (map['Rating'].contains("PG-13")) {
        this.Rating = "PG-13";
      } else {
        this.Rating = map['Rating'].split("-")[0];
      }
    } else {
      map['Rating'] = "N/A";
    }
    this.name = map['name'];
    if (map['Premiered'] != null) {
      this.date = map['Premiered']
          .replaceAll("Winter", "شتاء")
          .replaceAll("Spring", "الخريف")
          .replaceAll("Fall", "خريف")
          .replaceAll("Summer", "صيف");
    } else {
      this.date = "N/A";
    }
    this.numberOfServer = map['NumberOfServer'];
    this.type = map['Type'];

    if (map['Broadcast'] != null) {
      this.broadcast = getFromName(map['Broadcast']);
    } else {
      this.broadcast = "غير معروف";
    }

    if (map['Duration'] != null) {
      this.time = map['Duration'].replaceAll(" min. per ep.", " دقيقه ");
    } else {
      this.time = "24 min";
    }
    this.galary = map['Galary'];
    String type = map['type'];
    if (type != null) {
      if (type.contains("movie")) {
        genres = ["افلام"];
      }
      if (type.contains("ser")) {
        genres = ["مسلسلات"];
      }
      if (type.contains("anime")) {
        genres = ["انمي"];
      }
    } else {
      genres = ["غير معروف"];
    }
    if (map['Genres'] != null || map['Genres'] != "غير معروف") {
      genres = [];
      (map['Genres'] as List).map((i) => this.genres.add(i)).toList();
    }
    this.poster = map['poster'];
    this.description = map['Discription'];
    if (map['rating'] == null) {
      this.rating = 'غير معروف';
    } else
      this.rating = map['rating'].toString();
  }
  getFromName(name) {
    String date = name.split(" at ")[1];
    if (name.contains("Monday")) {
      return " ايام الاثنين " + date;
    } else if (name.contains("Tuesday")) {
      return " ايام الثلاثاء " + date;
    } else if (name.contains("Wednesday")) {
      return " ايام الخميس " + date;
    } else if (name.contains("Thursday")) {
      return " ايام الاربعاء " + date;
    } else if (name.contains("Friday")) {
      return " ايام الجمعه " + date;
    } else if (name.contains("Saturday")) {
      return " ايام السبت " + date;
    } else if (name.contains("Sunday")) {
      return " ايام الاحد " + date;
    }
  }
}
