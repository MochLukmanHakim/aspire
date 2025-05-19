import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aspireget/app/modules/home/controllers/home_controller.dart';
import 'package:aspireget/app/modules/histori_artikel/views/histori_artikel_view.dart';
import 'package:aspireget/app/modules/profile/views/profile_view.dart';
import 'package:aspireget/app/modules/artikel/views/artikel_view.dart';
import 'package:aspireget/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:aspireget/app/modules/survey/views/survey_view.dart';
import 'package:aspireget/app/modules/konselor/views/konselor_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C6B4F),
      body: Obx(() => _buildBody(controller.currentIndex.value)),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return HistoriArtikelView();
      case 1:
        return _buildHomeContent();
      case 2:
        return ProfileView();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/background_awan.png',
            width: 550,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            Padding(
  padding: const EdgeInsets.fromLTRB(20, 50, 20, 16),
  child: Row(
    children: [
      const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Hi, Manmaan",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text("Selamat datang di Aspire",
              style: TextStyle(color: Colors.white70, fontSize: 15)),
        ],
      ),
      const Spacer(),
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: () {
          Get.to(() => const NotifikasiView());
        },
      ),
    ],
  ),
),

            const SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
                  children: [
                    const Text("Kategori",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 16),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 30,
                        runSpacing: 20,
                        children: [
                          _buildCategoryCard(
                            'assets/icons/artikel.png',
                            "Artikel",
                            () => Get.to(() => ArtikelView()),
                          ),
                          _buildCategoryCard(
                            'assets/icons/survey.png',
                            "Survey",
                            () => Get.to(() => SurveyView()),
                          ),
                          _buildCategoryCard(
                            'assets/icons/konsultasi.png',
                            "Konsultasi",
                            () => Get.to(() => KonselorView()),
                          ),
                          _buildCategoryCard(
                            'assets/icons/pesan.png',
                            "Pesan",
                            () {
                              Get.snackbar("Konsultasi", "Navigasi ke halaman Konsultasi belum tersedia.");
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Artikel Terbaru",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 12),
                    _buildArticleCard(
                      'assets/images/artikel1.png',
                      'Yuk, Coba Pengembangan Diri Untuk Menggali Potensi Diri Yang Berguna Bagi Karirmu!',
                    ),
                    const SizedBox(height: 12),
                    _buildArticleCard(
                      'assets/images/artikel2.png',
                      'Studi:Kecanduan Gadget dan Pengaruhnya pada Perkembangan Anak',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 150,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildCategoryCard(String assetPath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF3F5F7),
            ),
            child: Center(
              child: Image.asset(assetPath, width: 28, height: 28),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _buildArticleCard(String imageAsset, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imageAsset, width: double.infinity, height: 150, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => Container(
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.history, 'Riwayat', 0),
              _buildNavItem(Icons.home_rounded, 'Home', 1),
              _buildNavItem(Icons.person_outline, 'Profil', 2),
            ],
          ),
        ));
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF0C6B4F) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF0C6B4F) : Colors.grey,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
