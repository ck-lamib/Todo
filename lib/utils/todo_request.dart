import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TodoRequest {
  static var headers = {
    "Accept": "application/json",
    "Authorization": "application/json",
    "token": ""
  };
  static Future<http.Response> post(Uri url, {Object? body}) async {
    try {
      http.Response response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 401) {}

      return response;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw "Server Error";
    }
  }

  static Future<http.Response> get(Uri url) async {
    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 401) {
        // logout from coreController
      }
      return response;
    } catch (e) {
      log(e.toString());
      throw "Server Error";
    }
  }
}
