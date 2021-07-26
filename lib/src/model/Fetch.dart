import 'dart:async';
import 'package:dio/dio.dart';
import 'models.dart';

class FetchApi {
  Future<List<VidModels>> fetchVid(
      String type, bool sorted, String genres) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshab.herokuapp.com"));
    var res = await client.post(
      "/api/movie/KarnoshApi",
      data: {"type": type, "sorted": sorted, "genres": genres},
    );
    List<VidModels> videos = [];
    for (var item in res.data) {
      videos.add(VidModels.fromJson(item));
    }
    return videos;
  }
}

class FetshServers {
  Future<List<SerModel>> fetchServer(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshab.herokuapp.com"));
    var res = await client.post(
      "/api/movie/KarnoshApi",
      data: {"name": name},
    );

    List<SerModel> servers = [];
    for (var item in res.data) {
      servers.add(SerModel.fromJson(item));
    }

    return servers;
  }
}
