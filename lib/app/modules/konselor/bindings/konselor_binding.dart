import 'package:get/get.dart';

import '../controllers/konselor_controller.dart';

class KonselorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonselorController>(
      () => KonselorController(),
    );
  }
}
