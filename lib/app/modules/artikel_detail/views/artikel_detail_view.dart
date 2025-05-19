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
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF6E8),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.bookmark_border, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image),
            ),
            const SizedBox(height: 16),
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
          ],
        ),
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
          Text("$number. ", style: const TextStyle(fontSize: 14)),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
