import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'Manmaan'.obs;
  final nis = '0012345'.obs;

  void logout() {
    // Tambahkan logika logout di sini
    Get.snackbar("Logout", "Berhasil logout");
  }
}
