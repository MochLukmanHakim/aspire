
import 'package:get/get.dart';
import '../controllers/histori_survey_controller.dart';

class HistoriSurveyBinding extends Bindings {
  @override
  void dependencies() {
    // Register the controller
    Get.lazyPut<HistoriSurveyController>(() => HistoriSurveyController());
    
    // You can register other dependencies here if needed
    // For example: repositories, services, etc.
    // Get.lazyPut<SurveyRepository>(() => SurveyRepositoryImpl());
    // Get.lazyPut<SurveyService>(() => SurveyServiceImpl(surveyRepository: Get.find()));
  }
}