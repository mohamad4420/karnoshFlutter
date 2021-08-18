import 'dart:async';
import 'package:dio/dio.dart';
import 'models.dart';

class FetchApi {
  Future<List<GeneralData>> fetchVid(
      String type, bool sorted, String genres) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/KarnoshApi",
      data: {"Type": type, "sorted": sorted, "Genres": genres},
    );

    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }

  Future<List<SerModel>> fetchServer(String name, int index) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/KarnoshApi",
      data: {"name": name, "index": index},
    );
    List<SerModel> servers = [];
    for (var item in res.data) {
      servers.add(SerModel.fromJson(item));
    }

    return servers;
  }

  Future<List<GeneralData>> information(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/searchName",
      data: {"name": name},
    );
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }

  Future<List<GeneralData>> related(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/related",
      data: {"name": name},
    );
    print(res);
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }

  Future<GeneralData> fetchSearch(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/search",
      data: {"name": name},
    );

    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data[0];
  }
}

class FetshServers {
  Future<List<SerModel>> fetchServer(String name, int index) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/KarnoshApi",
      data: {"name": name, "index": index},
    );
    List<SerModel> servers = [];
    for (var item in res.data) {
      servers.add(SerModel.fromJson(item));
    }

    return servers;
  }
}

class Information {
  Future<List<GeneralData>> fetchSearch(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/search",
      data: {"name": name},
    );
    List<GeneralData> data = res.data;
    return data;
  }
}

class Search {
  Future<List<GeneralData>> fetchSearch(String name) async {
    var client = Dio(BaseOptions(baseUrl: "http://karnoshapi.herokuapp.com"));
    var res = await client.post(
      "/DataVideo/search",
      data: {"name": name},
    );
    List<GeneralData> data = [];
    for (var item in res.data) {
      data.add(GeneralData.fromJson(item));
    }
    return data;
  }
}
