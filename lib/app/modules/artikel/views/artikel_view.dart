import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../artikel_detail/views/artikel_detail_view.dart';
import '../../notifikasi/views/notifikasi_view.dart';
import '../../histori_artikel/views/histori_artikel_view.dart';



class ArtikelController extends GetxController {
  var searchQuery = ''.obs;
  var categories = ['Mental', 'Edukasi', 'Karir', 'Pengembangan'].obs;

  void updateSearch(String query) {
    searchQuery.value = query;
  }
}

final ArtikelController artikelController = Get.put(ArtikelController());

class ArtikelView extends StatelessWidget {
  const ArtikelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(theme),
            _buildSearchBar(theme),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Artikel List
                      SizedBox(
                        height: 210, // Menambah tinggi lebih banyak untuk menampung info tambahan
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArtikelDetailView(
                                      title:
                                          "Yuk, Coba Pengembangan Diri Untuk Menggali Potensi Diri Yang Berguna Bagi Karirmu!",
                                      image: 'assets/images/artikel1.png',
                                    ));
                              },
                              child: buildArtikelCard(
                                title:
                                    "Yuk, Coba Pengembangan Diri Untuk Menggali Potensi Diri Yang Berguna Bagi Karirmu!",
                                image: 'assets/images/artikel1.png',
                                author: 'Dr. Sarah Wijaya',
                                date: '15 Mei 2024',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArtikelDetailView(
                                      title:
                                          "Studi: Kecanduan Game Pengaruhi Perilaku dan Perkembangan...",
                                      image: 'assets/images/artikel2.png',
                                    ));
                              },
                              child: buildArtikelCard(
                                title:
                                    "Studi: Kecanduan Game Pengaruhi Perilaku dan Perkembangan...",
                                image: 'assets/images/artikel2.png',
                                author: 'Prof. Ahmad Hidayat',
                                date: '12 Mei 2024',
                              ),
                            ),
                          ],
                        ),
                      ),


                      // Berdasarkan Kategori
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Berdasarkan Kategori",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Obx(() => Wrap(
                            spacing: 8,
                            children: artikelController.categories
                                .map(
                                  (cat) => Chip(
                                    label: Text(cat),
                                    shape: const StadiumBorder(
                                      side: BorderSide(color:Color(0xFF64B6AC)),
                                    ),
                                    backgroundColor: Colors.white, // Background chip putih
                                    labelStyle: const TextStyle(color: Color(0xFF2A6352)), // Meningkatkan kontras teks
                                  ),
                                )
                                .toList(),
                          )),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          Get.to(() => ArtikelDetailView(
                                title: "Cara Efektif Meningkatkan Kesehatan Mental dengan Olahraga",
                                image: 'assets/images/woman_stretching.png',
                              ));
                        },
                        child: buildLargeImageWithText(
                          image: 'assets/images/woman_stretching.png',
                          title: "Cara Efektif Meningkatkan Kesehatan Mental dengan Olahraga",
                          subtitle:
                              "Ketahui manfaat olahraga untuk mengelola stres dan meningkatkan kesejahteraan mental",
                          author: 'Dr. Maya Sari',
                          date: '10 Mei 2024',
                        ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          Get.to(() => ArtikelDetailView(
                                title: "Pola Makan Seimbang untuk Produktivitas Kerja Optimal",
                                image: 'assets/images/healthy_food.png',
                              ));
                        },
                        child: buildLargeImageWithText(
                          image: 'assets/images/healthy_food.png',
                          title: "Pola Makan Seimbang untuk Produktivitas Kerja Optimal",
                          subtitle:
                              "Panduan nutrisi harian yang mendukung fokus dan energi dalam aktivitas kerja",
                          author: 'Nutritionist Lisa Chen',
                          date: '08 Mei 2024',
                        ),
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(
            "Artikel",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2A6352),
            ),
          ),
          const Spacer(),
          PopupMenuButton<String>(
  onSelected: (String value) {
    // Handle menu selection
    switch (value) {
      case 'favorit':
        
        Get.to(() => HistoriArtikelView());
        
        break;
      case 'notifikasi':
    Get.to(() => NotifikasiView());
        break;
      case 'logout':
        
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
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          onChanged: artikelController.updateSearch,
          decoration: InputDecoration(
            hintText: 'Cari Artikel',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Color(0xFF2A6352),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  static Widget buildArtikelCard({
    required String title,
    required String image,
    required String author,
    required String date,
  }) {
    return Container(
      width: 220,
      height: 80,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 100,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.bookmark_border,
                    size: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 220,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 12,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                author,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    "Baca selengkapnya →",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF2A6352),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildLargeImageWithText({
    required String image,
    required String title,
    required String subtitle,
    required String author,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.bookmark_border,
                    size: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              author,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Baca selengkapnya →",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2A6352),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}