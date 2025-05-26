import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/histori_artikel_controller.dart';
import '../../histori_survey/controllers/histori_survey_controller.dart';
import '../../histori_survey/views/histori_survey_view.dart';
import '../../artikel_detail/views/artikel_detail_view.dart';

class HistoriArtikelView extends StatefulWidget {
  const HistoriArtikelView({super.key});

  @override
  State<HistoriArtikelView> createState() => _HistoriArtikelViewState();
}

class _HistoriArtikelViewState extends State<HistoriArtikelView> {
  int selectedTab = 0;
  DateTime selectedDate = DateTime.now();
  static const Color primaryColor = Color(0xFF2A6352);
  static const Color backgroundColor =  Color(0xFFF9FAFB);
  static const Color surfaceColor = Color.fromARGB(255, 255, 255, 255);

  final historiSurveyController = Get.put(HistoriSurveyController());
  final historiArtikelController = Get.put(HistoriArtikelController());

  // Data artikel yang di-bookmark
  final List<Map<String, dynamic>> bookmarkedArticles = [
    {
      'title': 'Yuk, Coba Pengembangan Diri Untuk Menggali Potensi Diri Yang Berguna Bagi Karirmu!',
      'subtitle': 'Panduan lengkap untuk mengembangkan diri dan menggali potensi yang dapat meningkatkan karir profesional Anda',
      'image': 'assets/images/artikel1.png',
      'author': 'Dr. Sarah Wijaya',
      'date': '15 Mei 2024',
      'category': 'Pengembangan Diri',
      'bookmarkedDate': DateTime(2024, 5, 20),
    },
    {
      'title': 'Studi: Kecanduan Game Pengaruhi Perilaku dan Perkembangan...',
      'subtitle': 'Penelitian terbaru menunjukkan dampak signifikan kecanduan game terhadap perkembangan psikologis dan sosial',
      'image': 'assets/images/artikel2.png',
      'author': 'Prof. Ahmad Hidayat',
      'date': '12 Mei 2024',
      'category': 'Psikologi',
      'bookmarkedDate': DateTime(2024, 5, 18),
    },
    {
      'title': 'Cara Efektif Meningkatkan Kesehatan Mental dengan Olahraga',
      'subtitle': 'Ketahui manfaat olahraga untuk mengelola stres dan meningkatkan kesejahteraan mental',
      'image': 'assets/images/woman_stretching.png',
      'author': 'Dr. Maya Sari',
      'date': '10 Mei 2024',
      'category': 'Kesehatan Mental',
      'bookmarkedDate': DateTime(2024, 5, 15),
    },
    {
      'title': 'Pola Makan Seimbang untuk Produktivitas Kerja Optimal',
      'subtitle': 'Panduan nutrisi harian yang mendukung fokus dan energi dalam aktivitas kerja',
      'image': 'assets/images/healthy_food.png',
      'author': 'Nutritionist Lisa Chen',
      'date': '08 Mei 2024',
      'category': 'Nutrisi',
      'bookmarkedDate': DateTime(2024, 5, 12),
    },
  ];

  void _changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: const Color(0xFF2A6352),
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "Survey",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2A6352),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton("Artikel", 0),
                const SizedBox(width: 50),
                _tabButton("Konselor", 1),
              ],
            ),
          ),
          
          Expanded(
            child: IndexedStack(
              index: selectedTab,
              children: [
                _artikelList(),
                HistoriSurveyView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => _changeTab(index),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? primaryColor : Colors.grey.shade400,
              fontSize: 15,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3,
            width: 90,
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _artikelList() {
    if (bookmarkedArticles.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada artikel yang disimpan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Simpan artikel favoritmu untuk dibaca nanti',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: bookmarkedArticles.length,
      itemBuilder: (context, index) => _buildBookmarkedArticleCard(bookmarkedArticles[index]),
    );
  }

  Widget _buildBookmarkedArticleCard(Map<String, dynamic> article) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ArtikelDetailView(
          title: article['title'],
          image: article['image'],
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    article['image'],
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        width: double.infinity,
                        color: primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.article_outlined,
                          color: primaryColor,
                          size: 64,
                        ),
                      );
                    },
                  ),
                ),
                // Bookmark-style category tag di pojok kiri atas
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    painter: BookmarkPainter(primaryColor),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 16,
                        top: 8,
                        bottom: 12,
                      ),
                      child: Text(
                        article['category'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: PopupMenuButton<String>(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        size: 18,
                        color: primaryColor,
                      ),
                    ),
                    onSelected: (value) {
                      if (value == 'remove') {
                        _removeBookmark(article);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'remove',
                        child: Row(
                          children: [
                            Icon(Icons.bookmark_remove, size: 18, color: Colors.red.shade600),
                            const SizedBox(width: 8),
                            Text(
                              'Hapus dari Simpanan',
                              style: TextStyle(color: Colors.red.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    article['subtitle'] ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
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
                                article['author'],
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
                            article['date'],
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
      ),
    );
  }

  void _removeBookmark(Map<String, dynamic> article) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Hapus dari Simpanan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2A6352),
            ),
          ),
          content: Text(
            'Apakah Anda yakin ingin menghapus artikel ini dari simpanan?',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Batal',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bookmarkedArticles.remove(article);
                });
                Navigator.of(context).pop();
                Get.snackbar(
                  'Berhasil',
                  'Artikel telah dihapus dari simpanan',
                  backgroundColor: primaryColor,
                  colorText: Colors.white,
                  borderRadius: 8,
                  margin: EdgeInsets.all(16),
                  duration: Duration(seconds: 2),
                );
              },
              child: Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Custom painter untuk membuat bentuk bookmark
class BookmarkPainter extends CustomPainter {
  final Color color;
  
  BookmarkPainter(this.color);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    final path = Path();
    
    // Membuat bentuk bookmark
    path.moveTo(0, 0); // Pojok kiri atas
    path.lineTo(size.width - 8, 0); // Ke kanan
    path.lineTo(size.width, 8); // Diagonal ke bawah
    path.lineTo(size.width, size.height - 8); // Ke bawah
    path.lineTo(size.width - 4, size.height); // Pojok bookmark kiri
    path.lineTo(size.width - 8, size.height - 4); // Pojok bookmark tengah
    path.lineTo(size.width - 12, size.height); // Pojok bookmark kanan
    path.lineTo(0, size.height); // Ke kiri
    path.close(); // Kembali ke awal
    
    // Menambahkan shadow/drop shadow
    canvas.drawShadow(path, Colors.black.withOpacity(0.3), 2, false);
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}