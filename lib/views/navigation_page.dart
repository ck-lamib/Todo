import 'package:counter_app/controller/navigation_controller.dart';
import 'package:counter_app/controller/todo_controller.dart';
import 'package:counter_app/views/fav_page.dart';
import 'package:counter_app/views/save_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class Navitations extends StatelessWidget {
  static const String nameRoute = '/navitationPage';
  Navitations({super.key});

  final NavigationController navController = Get.put(NavigationController());
  final DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var pages = [
      const MyApp(),
      FavouritePage(),
      SavePage(),
    ];
    return Scaffold(
        body: Obx(() => pages[navController.indexx.value]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 0,
          onPressed: () {
            Get.to(pages[2]);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              // selectedItemColor: Colors.blue,
              currentIndex: navController.indexx.value,
              onTap: navController.onChange,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                    label: "Favourite"),
              ],
            )));
  }
}
