import 'package:counter_app/views/detail_page.dart';
import 'package:counter_app/views/navigation_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

var getPages = [
  GetPage(name: Navitations.nameRoute, page: () => Navitations(), binding: BindingsBuilder(() {})),
];
