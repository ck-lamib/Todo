import 'dart:convert';
import 'dart:developer';
import 'package:counter_app/models/todo_model.dart';
import 'package:counter_app/utils/constants.dart';
import 'package:counter_app/utils/todo_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodRepo {
  static Future<void> addTodo(
      {required String todo,
      required String completed,
      required String userId,
      required Function(Todo todoItem) onSuccess,
      required Function(String message) onError}) async {
    try {
      var body = {
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };

      debugPrint('$body url ${Api.baseUrl}${Api.addTodoUrl}');
      var url = Uri.parse('${Api.baseUrl}${Api.addTodoUrl}');

      http.Response response = await TodoRequest.post(url, body: body);
      log("${Api.baseUrl}${Api.addTodoUrl} ===================>");
      log(response.body);

      dynamic data = json.decode(response.body);

      Todo todoitem = Todo.fromJson(data);
      onSuccess(todoitem);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry Something went wrong");
    }
  }
}
