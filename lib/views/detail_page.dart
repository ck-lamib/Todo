import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/models/todo_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final Todo todo;
  static const namedRoute = '/DetailPage';
  DetailPage({super.key, required this.todo});

  final DataController dc = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Todo ${todo.id}",
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        )),
        body: Center(
            child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Created by:",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${todo.userId}",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "Completed:",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${todo.completed}",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "Is Favourite:",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${todo.isFavourite}",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Description:",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${todo.todo}",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
