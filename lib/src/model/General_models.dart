class GeneralData {
  String name;
  String arabicName;
  String otherNames;
  String quality;
  String year;
  String date;
  String catagory;
  String type;
  String poster;
  String originalLink;
  String description;
  String rating;
  String time;
  String traler;
  String duration;
  String galary;
  String source;
  String ubdate;
  List<String> country =[""];
  List<String> servers =[""];
  List<String> genres = [""];
  List<Heros> heros = [];
  GeneralData(
          this.name,         //
          this.arabicName,   //
          this.heros,
          this.otherNames,   //
          this.quality,      //
          this.year,         //
          this.date,         //
          this.catagory,     //
          this.type,         //
          this.poster,       //
          this.originalLink, //
          this.description,  //
          this.rating,       //
          this.time,         //
          this.traler,       //
          this.duration,     //
          this.galary,       //
          this.source,       //
          this.ubdate,       //
          this.country,      //
          this.servers,      //
          this.genres        //
      );
  // get fucing

  GeneralData.fromJson(Map<String, dynamic> map) {
    this.catagory = map['catagory'];

    this.name = map['name'];
    this.traler = map['traler'];
    this.originalLink = map['originalLink'];

     if (map['arabicName'] != null || map['arabicName'] != 'N/A' ) {
      this.arabicName = map['arabicName'];
    } else {
      this.arabicName = "غير معروف";
    }
     if (map['otherNames'] != null || map['otherNames'] != 'N/A' ) {
       this.otherNames = map['otherNames'];
    } else {
      this.otherNames = "غير معروف";
    }
     if (map['quality'] != null || map['quality'] != 'N/A' ) {
      this.quality = map['quality'];
    } else {
      this.quality = "غير معروف";
    }
     if (map['year'] != null || map['year'] != 'N/A' ) {
      this.year = map['year'];
    } else {
      this.year = "غير معروف";
    }
    if (map['date'] != null || map['date'] != 'N/A' ) {
      this.date = map['date'];
    } else {
      this.date = "غير معروف";
    }

    this.type = map['Type'];

    if (map['ubdate'] != null) {
      DateTime now = new DateTime.now();
      print(now);
      final difference = now.difference(DateTime.parse(map['ubdate'])).inDays;
      print(difference);
      this.ubdate = difference.toString() + " ايام ";
    } else {
      this.ubdate = "غير معروف";
    }
      this.source = "غير معروف";

    if (map['duration'] != null || map['duration'] != "") {
      this.time = map['duration'];
    } else if(map['time'] != null || map['time'] != "") {
      this.time = map['time'];
    } else{
      this.time = "NA";
    }

    this.galary = map['galary'];

    String type = map['type'];
    if (type != null) {
      if (type.contains("movie_tr")) {
        genres = ["افلام تركي"];
      }
      else if (type.contains("movie_ar")) {
        genres = ["افلام عربية"];
      }
      else if (type.contains("movie_mt")) {
        genres = ["افلام مترجمة"];
      }
      else if (type.contains("movie_wth")) {
        genres = ["افلام وثائقية"];
      }
      else if (type.contains("movie_md")) {
        genres = ["افلام مدبلجة"];
      }
      else if (type.contains("movie_hn")) {
        genres = ["افلام هندوسي"];
      }
      else if (type.contains("anime")) {
        genres = ["انمي"];
      }
    } else {
      genres = ["غير معروف"];
    }
    
    if (map['genres'] != null || map['genres'] != "غير معروف") {
      genres = [];
      (map['genres'] as List).map((i) => this.genres.add(i)).toList();
    }
    /*if (map['heros'] != null || map['heros'] != "غير معروف") {
      heros = [];
      (map['heros'] as List).map((i) => this.heros.add(i)).toList();
    }*/
    if (map['country'] != null || map['country'] != "غير معروف") {
      country = [];
      (map['country'] as List).map((i) => this.country.add(i)).toList();
    }
    if (map['servers'] != null || map['servers'] != "غير معروف") {
      servers = [];
      (map['servers'] as List).map((i) => this.servers.add(i)).toList();
    }
    this.poster = map['poster'];
    this.description = map['description'];

    if (map['rating'] == null || map['rating'].length == 0) {
      this.rating = 'غير معروف';
    } else
      this.rating = map['rating'].toString();
  }
}
class Heros{
  String img;
  String name;
  Heros(this.img,this.name);
 Heros.fromJson(Map<String, dynamic> map){
   this.name = map['name'];
   this.img = map['img'];
 }
}
