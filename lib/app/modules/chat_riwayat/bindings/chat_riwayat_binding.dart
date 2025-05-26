import 'package:get/get.dart';

import '../controllers/chat_riwayat_controller.dart';

class ChatRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRiwayatController>(
      () => ChatRiwayatController(),
    );
  }
}
