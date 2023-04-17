import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt indexx = RxInt(0);

  onChange(int index) {
    indexx.value = index;
  }
}
