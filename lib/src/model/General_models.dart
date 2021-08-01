class GeneralData {
  String name;
  String date;
  String type;
  String poster;
  String description;
  String rating;
  String time;
  String galary;
  List<String> genres = [""];

  GeneralData(this.name, this.date, this.type, this.description, this.poster,
      this.rating, this.genres);
  GeneralData.fromJson(Map<String, dynamic> map) {
    this.name = map['name'];
    this.date = map['date'];
    this.type = map['type'];
    this.time = map['time'];
    this.galary = map['Galary'];
    String type = map['type'];
    if (type.contains("movie")) {
      genres = ["افلام"];
    }
    if (type.contains("ser")) {
      genres = ["مسلسلات"];
    }
    if (type.contains("anime")) {
      genres = ["انمي"];
    }

    if (map['genres'] != null || map['genres'] != "n/A") {
      (map['genres'] as List).map((i) => this.genres.add(i)).toList();
    }
    this.poster = map['poster'];
    this.description = map['Description'];
    if (map['rating'] == null) {
      this.rating = 'NoDATA';
    } else
      this.rating = map['rating'];
  }
}
