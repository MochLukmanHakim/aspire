import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    // Simulate splash screen delay
    await Future.delayed(const Duration(seconds: 3));
    // Navigate to login screen instead of home
    Get.offNamed('/login');
  }
}