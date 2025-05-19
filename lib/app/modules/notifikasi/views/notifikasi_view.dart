import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiView extends StatelessWidget {
  const NotifikasiView({super.key});

  Widget buildNotificationItem(String title, String message, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Hari Ini', style: TextStyle(color: Colors.grey)),
          ),
          buildNotificationItem(
            'Survey',
            'Hi Manman, Survey telah ditambahkan',
            Icons.assignment_outlined,
          ),
          buildNotificationItem(
            'Pengajar',
            'Hi Manman, Pak Asep telah menerima janji',
            Icons.person_outline,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('3 Hari Terakhir', style: TextStyle(color: Colors.grey)),
          ),
          buildNotificationItem(
            'Pesan',
            'Anda telah menerima pesan baru, ketuk ...',
            Icons.chat_bubble_outline,
          ),
          buildNotificationItem(
            'Artikel',
            'Yuk, Coba Pengembangan Diri Untuk ...',
            Icons.article_outlined,
          ),
        ],
      ),
    );
  }
}
