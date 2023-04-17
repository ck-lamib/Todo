import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/widget/alert_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavePage extends StatelessWidget {
  static const nameRoute = '/savePage';
  final DataController dc = Get.find();
  SavePage({super.key});

  final TextEditingController tododescriptioController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              DropdownButtonFormField(
                  hint: const Text("Completed"),
                  value: dc.choiceIndex.value,
                  items: dc.choices.map((String choice) {
                    return DropdownMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList(),
                  onChanged: (value) {
                    dc.choiceChange(value);
                  }),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("UserId"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 25,
                controller: tododescriptioController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('TodoDescription'),
                ),
              ),

              ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (ctx) => saveAlertDialog(
                            navigation: () {
                              // dc.add(
                              //     title: titleController.text,
                              //     description: descriptioController.text);
                              dc.addTodo(
                                  todo: tododescriptioController.text,
                                  userId: userIdController.text);

                              Get.back();
                              Get.back();
                            },
                          )),
                  child: const Text("Save")),
              //button :edit or cancel
            ],
          ),
        ),
      ),
    );
  }
}
