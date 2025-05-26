import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var profileImagePath = Rx<String?>('assets/images/user.png');

  var fullName = ''.obs;
  var username = ''.obs;
  var nis = ''.obs;
  var phoneNumber = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fullName.value = "MOCH. LUKMAN HAKIM";
    username.value = "Manmaan";
    nis.value = "0012345";
    phoneNumber.value = "+62 123 4567 8912";
    email.value = "Lukmanhakim2828@Gmail.Com";
  }

  void changeProfileImage(String newPath) {
    profileImagePath.value = newPath;
  }

  void saveProfile() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Profil berhasil disimpan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        borderRadius: 10,
      );
    }
  }
}
