import 'dart:convert';
import 'dart:developer';

import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/models/todo_model.dart';
import 'package:counter_app/utils/constants.dart';
import 'package:counter_app/utils/todo_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetTodoRepo {
  static DataController dc = Get.find();
  static Future<void> getTodos(
      {required Function(List<Todo> todo) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse('${Api.baseUrl}${Api.getTodoUrl}');

      http.Response response = await TodoRequest.get(url);

      dynamic data = json.decode(response.body);
      var todosData = data['todos'];

      var todosList = todosFromJson(todosData);
      onSuccess(todosList);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry Something went wrong");
      dc.isLoading.value = false;
    }
  }
}
