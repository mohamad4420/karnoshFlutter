import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  Future<List<VidModels>> fetchVid() async {
    http.Response response = await http
        .get(Uri.parse("https://karnoshab.herokuapp.com/api/movie/getMost"));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      List<VidModels> videos = [];
      for (var item in body) {
        videos.add(VidModels.fromJson(item));
      }

      return videos;
    }
    return null;
  }
}
