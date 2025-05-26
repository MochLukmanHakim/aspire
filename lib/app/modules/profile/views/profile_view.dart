import 'package:aspireget/app/modules/histori_artikel/views/histori_artikel_view.dart';
import 'package:aspireget/app/modules/pesan/views/pesan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aspireget/app/modules/home/controllers/home_controller.dart';
import '../../profile_detail/views/profile_detail_view.dart';
import '../../notifikasi/views/notifikasi_view.dart';
import '../../pesan/views/pesan_view.dart';
import '../../logout/views/logout_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 
      const Color(0xFF2A6352), 
      
      // Warna hijau tua (atas)
      body: SafeArea(
        child: Stack(
          children: [
            // Background putih yang sedikit turun
            Positioned(
              top: 152,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
              ),
            ),

            // Cloud background image
            Positioned(
              top: -35,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/background_awan.png',
                width: 550,
                fit: BoxFit.contain,
              ),
            ),

            // Konten utama
            Column(
              children: [
               // Header dengan styling yang sama seperti artikel AppBar
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
  child: Row(
    children: [
      const SizedBox(width: 8),
      Text(
        "Profil",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      const Spacer(),
      PopupMenuButton<String>(
  onSelected: (String value) {
    // Handle menu selection
    switch (value) {
      case 'favorit':
        // Aksi untuk favorit
        Get.to(() => HistoriArtikelView());
        // Tambahkan logika favorit di sini
        break;
      case 'notifikasi':
    Get.to(() => NotifikasiView());
        break;
      case 'logout':
        // Aksi untuk logout
showLogoutDialog(context);
        // Tambahkan logika logout di sini
        break;
    }
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
      value: 'favorit',
      child: Row(
        children: [
          Icon(
            Icons.bookmark_border,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Favorit'),
        ],
      ),
    ),
    const PopupMenuItem<String>(
      value: 'notifikasi',
      child: Row(
        children: [
          Icon(
            Icons.notifications_outlined,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Notifikasi'),
        ],
      ),
    ),
    const PopupMenuItem<String>(
      value: 'logout',
      child: Row(
        children: [
          Icon(
            Icons.logout,
            color: Color(0xFF2A6352),
            size: 20,
          ),
          SizedBox(width: 12),
          Text('Logout'),
        ],
      ),
    ),
  ],
  child: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Icon(
      Icons.more_vert,
      color: Color(0xFF2A6352),
      size: 18,
    ),
  ),
)
    ],
  ),
),
                // Konten isi di atas background putih dengan padding top untuk ruang foto profil
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 120, 24, 24), // Increased top padding
                    child: Column(
                      children: [
                        // Spacer untuk ruang foto profil
                        const SizedBox(height: 40), // Space for profile picture and "Ubah foto" text
                        
                        // Ringkasan Konsultasi
                        buildConsultationSummary(),
                        
                        const SizedBox(height: 24),
                        buildCompactAboutMe(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Foto profil yang fixed (tidak ikut scroll)
            Positioned(
              top: 90, // Posisi dari atas
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Foto profil
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Profile Image
                      const CircleAvatar(
                        radius: 63,
                        backgroundColor: Color(0xFFF9FAFB),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompactAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header dengan tombol edit
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tentang Saya",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            GestureDetector(
             onTap: () {
  Get.to(() => ProfileDetailView());
},

              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF0C9B82).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF0C9B82).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.edit_outlined,
                      size: 14,
                      color: Color(0xFF0C9B82),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2A6352),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Nama Lengkap (full width)
        buildCompactField("Nama Lengkap", "MOCH. LUKMAN HAKIM"),
        
        const SizedBox(height: 12),
        
        // NIS dan Nama Pengguna (side by side)
        Row(
          children: [
            Expanded(
              child: buildCompactField("NIS", "0012345"),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: buildCompactField("Nama Pengguna", "Manmaan"),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // No Telephone dan Email (full width)
        buildCompactField("No Telephone", "+62 123 4567 8912"),
        const SizedBox(height: 12),
        buildCompactField("Email", "Lukmanhakim2828@Gmail.Com"),
      ],
    );
  }

  Widget buildCompactField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1), // warna bayangan
        spreadRadius: 1, // sebaran bayangan
        blurRadius: 3,   // seberapa blur
        offset: const Offset(0, 2), // posisi bayangan (x, y)
      ),
    ],
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
          ),
        ),
      ],
    );
  }

 Widget buildConsultationSummary() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF2A6352).withOpacity(0.7),
          const Color(0xFF2A6352).withOpacity(0.7),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF2A6352).withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header dengan icon yang lebih modern
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.psychology_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Riwayat Konsultasi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Statistik dalam bentuk horizontal compact
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildCompactStat(
                  icon: Icons.chat_bubble_outline,
                  label: "Total",
                  value: "8",
                ),
              ),
              Container(
                width: 1,
                height: 30,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: _buildCompactStat(
                  icon: Icons.calendar_today,
                  label: "Bulan Ini",
                  value: "1",
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Konsultasi terakhir dalam bentuk yang lebih compact
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ibu. Sujiati S.Pd",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    " 23 Mei 2025",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<HomeController>().changePage(0);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildCompactStat({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
      const SizedBox(width: 6),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ],
  );
}
}