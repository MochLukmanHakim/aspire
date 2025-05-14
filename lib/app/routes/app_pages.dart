import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/histori_artikel/bindings/histori_artikel_binding.dart';
import '../modules/histori_artikel/views/histori_artikel_view.dart';
import '../modules/histori_survey/bindings/histori_survey_binding.dart';
import '../modules/histori_survey/views/histori_survey_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_ARTIKEL,
      page: () => const HistoriArtikelView(),
      binding: HistoriArtikelBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_SURVEY,
      page: () => HistoriSurveyView(),
      binding: HistoriSurveyBinding(),
    ),
  ];
}
