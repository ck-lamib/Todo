import 'dart:async';

import 'package:counter_app/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  static const nameRoute = "/splashPage";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => Navitations());
    });

    return const Scaffold(
      body: Center(
          child: Text(
        "Welcome to ToDo",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      )),
    );
  }
}
