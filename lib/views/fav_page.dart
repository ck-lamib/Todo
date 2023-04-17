import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/widget/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  static const nameRoute = '/favouritePage';
  FavouritePage({super.key});

  final DataController dc = Get.find();
  getItem(var index) {
    var todo = dc.displayTodos[index];
    if (todo.value.isFavourite) {
      return TodoItem(
        todo: todo.value,
        onFavourite: () {
          todo.update((val) {
            val!.isFavourite = !val.isFavourite;
          });
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite ToDo")),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Obx(() => getItem(index));
          },
          itemCount: dc.displayTodos.length,
        ),
      ),
    );
  }
}
