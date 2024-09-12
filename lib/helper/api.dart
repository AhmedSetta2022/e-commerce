import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getRequest(
      {required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("there is aproblem with ${response.statusCode}");
    }
  }

  Future<dynamic> postRequest(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return data;
    } else {
      throw Exception(
          "there is aproblem with body ${jsonDecode(response.body)} , and status code is : ${response.statusCode}");
    }
  }

  Future<dynamic> putRequest(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return data;
    } else {
      throw Exception(
          "there is aproblem with body ${jsonDecode(response.body)} , and status code is : ${response.statusCode}");
    }
  }
}
