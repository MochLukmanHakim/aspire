// home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 1.obs;

  void changePage (int index) {
    currentIndex.value = index;
  }

  void resetPage () {
    currentIndex.value = 0;
  }
}