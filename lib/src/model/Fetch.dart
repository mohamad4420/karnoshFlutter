import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  Future<List<vidModels>> fetchVid() async {
    http.Response response = await http
        .get(Uri.parse("https://karnoshab.herokuapp.com/api/movie/topAnimeA"));

    print(json.decode(response.body)[0]);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      List<vidModels> videos = [];
      for (var item in body) {
        videos.add(vidModels.fromJson(item));
      }
      return videos;
    }
    return null;
  }
}
