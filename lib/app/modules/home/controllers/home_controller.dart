import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 1.obs;
  final pageHistory = <int>[1].obs; // Default ke halaman home (index 1)

  void changePage(int index) {
    if (currentIndex.value != index) {
      pageHistory.add(index);
      currentIndex.value = index;
    }
  }

  bool handleBack() {
    if (pageHistory.length > 1) {
      pageHistory.removeLast();
      currentIndex.value = pageHistory.last;
      return true; // Menangani back secara manual
    }
    return false; // Tidak ada halaman sebelumnya
  }
}
