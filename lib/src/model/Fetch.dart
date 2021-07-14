import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'models.dart';

class FetchApi {
  Future<List<VidModels>> fetchVid(
      String type, bool sorted, String genres) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(
        Uri.parse("http://karnoshab.herokuapp.com/api/movie/KarnoshApi"));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(
        json.encode({"type": type, "sorted": sorted, "genres": genres})));
    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();
    var body = json.decode(reply);
    httpClient.close();
    List<VidModels> videos = [];
    for (var item in body) {
      videos.add(VidModels.fromJson(item));
    }

    return videos;
  }
}
