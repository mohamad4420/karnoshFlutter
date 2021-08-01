import 'dart:async';
import 'package:dio/dio.dart';
import 'models.dart';

class FetchApi {
  Future<List<GeneralData>> fetchVid(
      String type, bool sorted, String genres) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshab.herokuapp.com"));
    var res = await client.post(
      "/api/movie/KarnoshApi",
      data: {"type": type, "sorted": sorted, "genres": genres},
    );
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
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

class Search {
  Future<List<GeneralData>> fetchSearch(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshab.herokuapp.com"));
    var res = await client.post(
      "/api/movie/search",
      data: {"name": name},
    );
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }
}
