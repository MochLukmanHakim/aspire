import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/artikel_detail_controller.dart';

class ArtikelDetailView extends GetView<ArtikelDetailController> {
  final String title;
  final String image;

  const ArtikelDetailView({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final RxBool showScrollToTop = false.obs;

    // Listen to scroll changes
    scrollController.addListener(() {
      if (scrollController.offset >= 200) {
        showScrollToTop.value = true;
      } else {
        showScrollToTop.value = false;
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Stack(
        children: [
          Column(
            children: [
              // Custom AppBar
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Container(
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
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFF2A6352),
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        "Artikel",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2A6352),
                        ),
                      ),
                      const Spacer(),
                      Container(
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
                        child: GestureDetector(
                          onTap: () {
                            // Toggle bookmark atau aksi lainnya
                            // Anda bisa menambahkan controller untuk bookmark di sini
                          },
                          child: const Icon(
                            Icons.bookmark_border,
                            color: Color(0xFF2A6352),
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with padding
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Full width image
                     SizedBox(
  width: double.infinity,
  height: 200,
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 12), // Jarak kanan kiri
    child: Image.asset(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(
              Icons.image_not_supported,
              color: Colors.grey,
              size: 50,
            ),
          ),
        );
      },
    ),
  ),
),
                      
                      const SizedBox(height: 20),
                      
                      // Content with padding
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pengembangan diri adalah proses yang dilakukan seseorang untuk membentuk potensi, bakat, sikap, perilaku, dan kepribadian. Tujuan utamanya adalah memenuhi kebutuhan aktualisasi diri agar mampu bersaing dan memiliki kualitas yang lebih baik dalam kehidupan pribadi maupun profesional.',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Melalui proses ini, seseorang dapat mengenali kekuatan dan kelemahan diri, meningkatkan keterampilan, serta membangun kepercayaan diri dalam menghadapi berbagai tantangan.',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Pentingnya Pengembangan Diri',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Dalam era globalisasi dan perkembangan teknologi yang pesat, pengembangan diri menjadi semakin penting. Setiap individu dituntut untuk terus belajar dan beradaptasi dengan perubahan yang terjadi. Tanpa pengembangan diri yang berkelanjutan, seseorang akan tertinggal dan kesulitan bersaing dalam dunia kerja yang kompetitif.',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Pengembangan diri juga berperan penting dalam meningkatkan kualitas hidup secara keseluruhan. Dengan mengembangkan kemampuan dan potensi yang dimiliki, seseorang dapat meraih pencapaian yang lebih baik, baik dalam karier maupun kehidupan personal.',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Tujuan Pengembangan Diri',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const TujuanListItem(number: 1, text: 'Memberikan kesempatan bagi diri untuk mengembangkan dan mengekspresikan potensi.'),
                            const TujuanListItem(number: 2, text: 'Memperbarui kemampuan, keahlian, dan pengetahuan sesuai perkembangan.'),
                            const TujuanListItem(number: 3, text: 'Meningkatkan produktivitas dalam bekerja.'),
                            const TujuanListItem(number: 4, text: 'Membantu menghadapi perubahan dunia kerja yang cepat.'),
                            const TujuanListItem(number: 5, text: 'Membentuk individu yang profesional dalam bekerja.'),
                            const SizedBox(height: 24),
                            const Text(
                              'Strategi Pengembangan Diri',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const StrategiListItem(title: 'Belajar Berkelanjutan', description: 'Terus belajar hal-hal baru melalui buku, kursus online, seminar, atau workshop. Jangan pernah berhenti untuk menambah pengetahuan dan keterampilan.'),
                            const StrategiListItem(title: 'Refleksi Diri', description: 'Luangkan waktu untuk merefleksikan pencapaian, kegagalan, dan pelajaran yang didapat. Ini membantu dalam mengenali area yang perlu diperbaiki.'),
                            const StrategiListItem(title: 'Networking', description: 'Bangun jaringan profesional yang luas. Berinteraksi dengan orang-orang yang dapat memberikan inspirasi dan peluang baru.'),
                            const StrategiListItem(title: 'Keluar dari Zona Nyaman', description: 'Berani mengambil tantangan baru dan menghadapi situasi yang tidak familiar. Ini akan mempercepat pertumbuhan personal dan profesional.'),
                            const SizedBox(height: 24),
                            const Text(
                              'Manfaat Pengembangan Diri',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Pengembangan diri memberikan berbagai manfaat yang signifikan dalam kehidupan seseorang:',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 12),
                            const ManfaatListItem(icon: Icons.trending_up, title: 'Peningkatan Karier', description: 'Kemampuan yang terus berkembang membuka peluang promosi dan kesempatan karier yang lebih baik.'),
                            const ManfaatListItem(icon: Icons.psychology, title: 'Kepercayaan Diri', description: 'Dengan menguasai berbagai keterampilan, kepercayaan diri akan meningkat dalam menghadapi berbagai situasi.'),
                            const ManfaatListItem(icon: Icons.group, title: 'Hubungan Interpersonal', description: 'Kemampuan komunikasi dan empati yang berkembang akan meningkatkan kualitas hubungan dengan orang lain.'),
                            const ManfaatListItem(icon: Icons.lightbulb, title: 'Kreativitas dan Inovasi', description: 'Pengembangan diri merangsang pemikiran kreatif dan kemampuan untuk menemukan solusi inovatif.'),
                            const SizedBox(height: 24),
                            const Text(
                              'Kesimpulan',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Pengembangan diri merupakan investasi jangka panjang yang sangat berharga. Dengan komitmen dan konsistensi dalam mengembangkan diri, setiap individu dapat meraih potensi terbaiknya dan mencapai kesuksesan baik dalam kehidupan profesional maupun personal. Ingatlah bahwa pengembangan diri adalah perjalanan seumur hidup yang tidak pernah berakhir.',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Scroll to top button
          Positioned(
            bottom: 24,
            right: 16,
            child: Obx(() => AnimatedOpacity(
              opacity: showScrollToTop.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: showScrollToTop.value
                  ? FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      backgroundColor: const Color(0xFF2A6352),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : const SizedBox.shrink(),
            )),
          ),
        ],
      ),
    );
  }
}

class TujuanListItem extends StatelessWidget {
  final int number;
  final String text;

  const TujuanListItem({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$number. ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class StrategiListItem extends StatelessWidget {
  final String title;
  final String description;

  const StrategiListItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2A6352),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class ManfaatListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ManfaatListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A6352).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2A6352),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A6352),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}