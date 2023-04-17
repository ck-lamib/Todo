import 'dart:developer';

import 'package:counter_app/models/todo_model.dart';
import 'package:counter_app/repos/auth/add_todo_repo.dart';
import 'package:counter_app/repos/auth/get_todo_repo.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  // RxList<RxMap<String, dynamic>> datas = RxList<RxMap<String, dynamic>>([
  //   RxMap({"title": "title1", "description": "description1", "isFavourite": false}),
  //   RxMap({"title": "title2", "description": "description2", "isFavourite": false}),
  //   RxMap({"title": "title3", "description": "description3", "isFavourite": false}),
  // ]);

  RxList<Todo> todos = RxList([]);
  RxList<Rx<Todo>> favouriteDatas = RxList([]);
  RxList<Rx<Todo>> displayTodos = RxList([]);

  var isLoading = false.obs;
  List<String> choices = ['true', 'false'];
  var choiceIndex = "true".obs;
  choiceChange(String? value) {
    choiceIndex.value = value!;
  }

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> addTodo({
    required String todo,
    required String userId,
  }) async {
    await AddTodRepo.addTodo(
      todo: todo,
      completed: choiceIndex.value,
      userId: userId,
      onSuccess: (todo) {
        log(todo.id.toString());
      },
      onError: (message) {
        log(message);
      },
    );
  }

  Future<void> getTodos() async {
    isLoading.value = true;
    await GetTodoRepo.getTodos(
      onSuccess: (value) {
        todos.value = value;
      },
      onError: (value) {},
    );
    displayTodos.addAll(todos.map((element) => Rx<Todo>(element)).toList());
    isLoading.value = false;
  }

  // add({required String title, required String description}) {
  //   // RxMap<String, dynamic> newData =
  //   //     RxMap({"title": title, "description": description, "isFavourite": false});
  //   // datas.add(newData);
  //   addTodo();
  // }

  // edit(
  //     {required String title,
  //     required String description,
  //     required int index,
  //     required bool isFavourite}) {
  //   datas[index] = RxMap({"title": title, "description": description, "isFavourite": isFavourite});
  // }

  // delete({required int index}) {
  //   datas.removeAt(index);
  // }

  addToFavourite(int index) {
    var data = displayTodos[index];
    if (favouriteDatas.isNotEmpty) {
      for (var element in favouriteDatas) {
        if (element.value.id == data.value.id) {
          favouriteDatas.remove(element);
          return;
        }
      }
    }
    favouriteDatas.add(data);
  }
}
