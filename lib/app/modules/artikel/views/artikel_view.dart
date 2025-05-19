import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../artikel_detail/views/artikel_detail_view.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3FBF2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Artikel Terbaru",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
            onPressed: () {
              // Arahkan ke halaman notifikasi jika ada
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: artikelController.updateSearch,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Artikel List
                SizedBox(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
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
                        ),
                      ),
                      buildArtikelCard(
                        title:
                            "Studi: Kecanduan Game Pengaruhi Perilaku dan Perkembangan...",
                        image: 'assets/images/artikel2.png',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Berdasarkan Kategori
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Berdasarkan Kategori",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward),
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
                                side: BorderSide(color: Colors.teal),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          )
                          .toList(),
                    )),

                const SizedBox(height: 20),

                buildLargeImageWithText(
                  image: 'assets/images/woman_stretching.png',
                  title: "Cara Efektif Meningkatkan Kesehatan Mental dengan Olahraga",
                  subtitle:
                      "Ketahui manfaat olahraga untuk mengelola stres dan meningkatkan kesejahteraan mental",
                ),

                const SizedBox(height: 20),

                buildLargeImageWithText(
                  image: 'assets/images/healthy_food.png',
                  title: "Pola Makan Seimbang untuk Produktivitas Kerja Optimal",
                  subtitle:
                      "Panduan nutrisi harian yang mendukung fokus dan energi dalam aktivitas kerja",
                ),

                const SizedBox(height: 15),

                // Dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 4,
                      color: Colors.green,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Container(
                      width: 10,
                      height: 4,
                      color: Colors.green.shade100,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Container(
                      width: 10,
                      height: 4,
                      color: Colors.green.shade100,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildArtikelCard({
    required String title,
    required String image,
  }) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          const Text(
            "Baca selanjutnya",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  static Widget buildLargeImageWithText({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
