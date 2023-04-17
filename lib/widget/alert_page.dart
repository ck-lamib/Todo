
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget saveAlertDialog({required Function navigation}) {
  getNavigation() {
    navigation();
  }

  return AlertDialog(
    title: const Text("Save Data"),
    content: const Text("Save the given data."),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: getNavigation,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: const Text("Okay",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    ],
  );
}
