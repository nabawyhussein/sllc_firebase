import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../resources/network_api_path_controller.dart';

class APIClient {
  static Future<http.Response?> getDataWithHttp(
      {String? path, String? token}) async {
    http.Response? response =
        await http.get(Uri.parse(ApiPaths.serverId + path!), headers: {
      "authorization": 'Bearer $token',
      "Content-type": "Application/json",
    });
    return response;
  }

  static Future<http.Response> postDataWithHttp(
      {required String path, dynamic body, String? token}) async {
    http.Response? response = await http
        .post(Uri.parse(ApiPaths.serverId + path), body: body, headers: {
      "authorization": 'Bearer $token',
      "Content-type": "Application/json",
    });
    print("ApiPaths.serverId + path");
    print(ApiPaths.serverId + path);
    return response;
  }

  static Future<Response> postDataWithDio(
      {String? path, dynamic data, String? token}) async {
    Response response = await Dio().post(ApiPaths.serverId + path!,
        data: FormData.fromMap(data),
        options: Options(
          method: 'POST',
          responseType: ResponseType.json,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        ));
    return response;
  }

  static Future<Response> getDataWithDio(
      {String? path, dynamic data, String? token}) async {
    Response response = await Dio().get(ApiPaths.serverId + path!,
        options: Options(
          method: 'GET',
          responseType: ResponseType.json,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        ));
    return response;
  }
}
