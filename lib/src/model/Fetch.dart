import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  Future<VidModels> fetchVid() async {
    http.Response response = await http
        .get(Uri.parse("https://karnoshab.herokuapp.com/api/movie/topAnimeA"));

    print(json.decode(response.body)[4]);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      VidModels videos;

      videos = (VidModels.fromJson(body[9]));

      return videos;
    }
    return null;
  }
}
