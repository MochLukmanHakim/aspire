import 'package:get/get.dart';

import '../modules/artikel/bindings/artikel_binding.dart';
import '../modules/artikel/views/artikel_view.dart';
import '../modules/artikel_detail/views/artikel_detail_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chat_riwayat/bindings/chat_riwayat_binding.dart';
import '../modules/chat_riwayat/views/chat_riwayat_view.dart';
import '../modules/histori_artikel/bindings/histori_artikel_binding.dart';
import '../modules/histori_artikel/views/histori_artikel_view.dart';
import '../modules/histori_survey/bindings/histori_survey_binding.dart';
import '../modules/histori_survey/views/histori_survey_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/konselor/bindings/konselor_binding.dart';
import '../modules/konselor/views/konselor_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pesan/bindings/pesan_binding.dart';
import '../modules/pesan/views/pesan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_detail/bindings/profile_detail_binding.dart';
import '../modules/profile_detail/views/profile_detail_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/survey/bindings/survey_binding.dart';
import '../modules/survey/views/survey_view.dart';

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
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKEL,
      page: () => ArtikelView(),
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: '/artikel-detail',
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ArtikelDetailView(
          title: args['title'],
          image: args['image'],
        );
      },
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY,
      page: () => SurveyView(),
      binding: SurveyBinding(),
    ),
    GetPage(
      name: _Paths.KONSELOR,
      page: () => const KonselorView(),
      binding: KonselorBinding(),
    ),
    GetPage(
      name: _Paths.PESAN,
      page: () => PesanView(),
      binding: PesanBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAIL,
      page: () => ProfileDetailView(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_RIWAYAT,
      page: () =>  ChatRiwayatView(),
      binding: ChatRiwayatBinding(),
    ),
  ];
}
