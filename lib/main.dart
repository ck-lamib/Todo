import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/views/splash_page.dart';
import 'package:counter_app/widget/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    DataController contorller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: Obx(
        () => contorller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var todo = contorller.displayTodos[index]; //observable todo
                    return Obx(() => TodoItem(
                          todo: todo.value,
                          onFavourite: () {
                            todo.update((val) {
                              val!.isFavourite = !val.isFavourite;
                              contorller.addToFavourite(index);
                              print(contorller.favouriteDatas);
                            });
                          },
                        ));
                  },
                  itemCount: contorller.displayTodos.length,
                ),
              ),
      ),
    );
  }
}

// all data = {}, favourite={}, display data={} if page=home all data display else favourite data display

