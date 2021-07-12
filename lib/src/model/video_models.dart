class VidModels {
  /*
  final List<String> genres;
  final List<String> SeasonData;
  final String name;
  final List<Actor> Heros;
  final String time;
  final String season;
  final String date;
  final String rating;
  final String description;
  final String poster;
  final String update;
  final List<Eps> ep;
  final String galary;
  final String linkTraler;
  final List<String> Server;
  final List<String> related;
  final String type;
  final String updatedAt;
  final String createdAt;
  */
  String name;
  String date;
  String type;
  String poster;
  String description;
  String rating;

  VidModels(this.name, this.date, this.type, this.description, this.poster,
      this.rating);
  VidModels.fromJson(Map<String, dynamic> map) {
    this.name = map['name'];
    this.date = map['date'];
    this.type = map['type'];
    this.poster = map['poster'];
    this.description = map['Description'];
    if (map['rating'] == null) {
      this.rating = 'NoDATA';
    } else
      this.rating = map['rating'];
  }
}
