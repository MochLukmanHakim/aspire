import 'package:aspireget/app/modules/chat/views/chat_view.dart';
import 'package:aspireget/app/modules/pesan/views/pesan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aspireget/app/modules/home/controllers/home_controller.dart';
import 'package:aspireget/app/modules/profile/views/profile_view.dart';
import 'package:aspireget/app/modules/artikel/views/artikel_view.dart';
import 'package:aspireget/app/modules/konselor/views/konselor_view.dart';
import 'package:aspireget/app/modules/notifikasi/views/notifikasi_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final handled = controller.handleBack();
        return !handled; // return false jika kita handle sendiri (tidak keluar app)
      },
      child: Scaffold(
        backgroundColor: Colors.white, // Ubah ke putih
        body: Obx(() => _buildBody(controller.currentIndex.value)),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return PesanView();
      case 1:
        return _buildHomeContent();
      case 2:
        return ArtikelView();
      case 3:
        return KonselorView();
      case 4:
        return ProfileView();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Stack(
      children: [
        // Background hijau hanya untuk bagian atas
        Container(
          height: 220, // Sesuaikan tinggi sesuai kebutuhan
          decoration: const BoxDecoration(
            color: Color(0xFF2A6352),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/background_awan.png',
            width: 550,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 51, left: 366),
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Get.to(() => NotifikasiView());
            },
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 16),
              child: Row(
                children: [
                  // Bungkus CircleAvatar dengan GestureDetector
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke ProfileView atau langsung ke tab profil
                      Get.find<HomeController>().changePage(4); // Navigate to Profile tab
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFF9FAFB),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Hi, Manmaan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text("Selamat datang di EduMind",
                          style: TextStyle(color: Colors.white70, fontSize: 15)),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
                  children: [
                    // Static Cards with spacing (MOVED TO TOP)
                    _buildStaticCards(),
                    const SizedBox(height: 24),
                    // Top Konselor Section
                    _buildTopKonselorSection(),
                    const SizedBox(height: 24),
                    // Appointment Card (MOVED TO BOTTOM)
                    _buildAppointmentCard(),
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

Widget _buildAppointmentCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border(
        left: BorderSide(
          color: const Color(0xFF2A6352), // Menggunakan warna hijau tema aplikasi
          width: 4,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2A6352), // Hijau tema aplikasi
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Sedang Berlangsung',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Appointment Time Info
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 18,
                  color: const Color(0xFF2A6352),
                ),
                const SizedBox(width: 8),
                Text(
                  '26 Mei • 10:00 - 11:30',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Doctor Info
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD9FFF8),
                    border: Border.all(
                      color: Color(0xFFD9FFF8),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/konselor1.png', // Path ke gambar di folder assets
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback jika gambar tidak ditemukan
                        return Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9FFF8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: const Color(0xFF2A6352),
                            size: 24,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bpk. Rahmat S.Pd',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '2 chat belum dibaca',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Extra space untuk chat button
          ],
        ),
        // Chat Button - Positioned at bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // Handle chat
              Get.to(() => (ChatView()));
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const  Color(0xFF2A6352), // Background hijau
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const  Color(0xFF2A6352).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white, // Icon putih
                size: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
  Widget _buildTopKonselorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Konselor Teratas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<HomeController>().changePage(3); // Navigate to KonselorView
                },
                child: Text(
                  'Lihat semua',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF2A6352),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140, // Tingkatkan dari 120 ke 140
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            children: [
              _buildKonselorCard(
                'Bpk. Rahmat ',
                'Psikolog Klinis',
                '100 konsultasi / perbulan',
                'assets/images/konselor1.png',
              ),
              const SizedBox(width: 16),
              _buildKonselorCard(
                'Ibu. Sujiati ',
                'Psikiater',
                '50 konsultasi / perbulan',
                'assets/images/konselor2.png',
              ),
              const SizedBox(width: 16),
              _buildKonselorCard(
                'Bpk. Ahmad Supriyadi',
                'Psikolog Anak',
                '30 konsultasi / perbulan',
                'assets/images/konselor3.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKonselorCard(String name, String specialty, String consultations, String imagePath) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12), // Kurangi padding dari 16 ke 12
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Tambahkan ini
        children: [
          Container(
            width: 60, // Kurangi dari 50 ke 45
            height: 60, // Kurangi dari 50 ke 45
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade100,
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF2A6352),
                          const Color(0xFF4A90A4),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 24, // Kurangi dari 28 ke 24
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 6), // Kurangi dari 8 ke 6
          Text(
            name,
            style: TextStyle(
              fontSize: 14, // Kurangi dari 14 ke 13
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2), // Kurangi dari 4 ke 3
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), // Kurangi padding horizontal dari 8 ke 6
            decoration: BoxDecoration(
              color: const Color(0xFF2A6352).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              consultations,
              style: TextStyle(
                fontSize: 10, // Kurangi dari 11 ke 10
                color: const Color(0xFF2A6352),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticCards() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width - 40, // Full width minus padding
            child: _buildConsultationCard(),
          ),
          const SizedBox(width: 16), // Jarak antar card
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width - 40, // Full width minus padding
            child: _buildStressManagementCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultationCard() {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().changePage(3); // Navigate to KonselorView
      },
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 98, 158, 140), // Hijau utama
              const Color(0xFF1E4A3F), // Hijau lebih gelap
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/ilustrasi_konsul.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.psychology_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Lagi banyak pikiran?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'Konselor siap jadi teman ngobrol',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStressManagementCard() {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().changePage(2); // Navigate to ArtikelView
      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF4A90A4), // Biru kehijauan
              const Color(0xFF2A6352), // Hijau utama
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Butuh ruang sendiri dulu?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'Artikel ini bisa nemenin kamu sejenak.',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/ilustrasi_artikel.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.self_improvement_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.psychology_outlined, 'Konselor', 3),
              _buildNavItem(Icons.message_outlined, 'Pesan', 0),
              _buildNavItem(Icons.home_outlined, 'Home', 1),
              _buildNavItem(Icons.article_outlined, 'Artikel', 2),
              _buildNavItem(Icons.person_outline, 'Profil', 4),
            ],
          ),
        ));
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isActive ? const Color(0xFF0C6B4F).withOpacity(0.1) : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xFF0C6B4F) : Colors.transparent,
              ),
              child: Icon(
                icon,
                color: isActive ? Colors.white : Colors.grey.shade600,
                size: isActive ? 22 : 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF0C6B4F) : Colors.grey.shade600,
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}