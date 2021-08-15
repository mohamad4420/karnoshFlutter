import 'dart:async';
import 'package:dio/dio.dart';
import 'models.dart';

class FetchApi {
  Future<List<GeneralData>> fetchVid(
      String type, bool sorted, String genres) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/KarnoshApi",
      data: {"Type": type, "sorted": sorted, "genres": genres},
    );
    print(res);
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }
}

class FetshServers {
  Future<List<SerModel>> fetchServer(String name, int index) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/KarnoshApi",
      data: {"name": name, "index": index},
    );
    print(res);
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
