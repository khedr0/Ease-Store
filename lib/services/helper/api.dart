import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  Dio dio = Dio();
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    Response response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          "There was ERROR  with status code ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    Dio dio = Dio();
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  Future<dynamic> put(
      {required int id,
      required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    print("url: $url , data : $data  , token : $token ");
    Dio dio = Dio();
    Response response = await dio.put("$url/$id", data: data);

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else
      throw Exception("there is a problem ${response.statusCode}");
  }
}
