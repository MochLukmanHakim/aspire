import 'package:get/get.dart';
import '../controllers/histori_artikel_controller.dart';

class HistoriArtikelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriArtikelController>(
      () => HistoriArtikelController(),
    );
  }
}