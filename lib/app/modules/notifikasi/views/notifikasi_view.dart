import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiView extends StatelessWidget {
  const NotifikasiView({super.key});

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required IconData icon,
    required String time,
    bool isUnread = false,
  }) {
    const primaryColor = Color(0xFF2A6352);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUnread ? primaryColor.withOpacity(0.2) : Colors.grey.shade100,
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 18),
          ),
          const SizedBox(width: 12),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: isUnread ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF2A6352);
    
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.snackbar(
                'Berhasil',
                'Semua notifikasi telah dibaca',
                snackPosition: SnackPosition.TOP,
                backgroundColor: primaryColor,
                colorText: Colors.white,
              );
            },
            child: const Text(
              'Tandai Semua',
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader('HARI INI'),
          _buildNotificationItem(
            title: 'Pengajar Mengonfirmasi',
            message: 'Hi Manman, Bpk. Rahmat telah menerima janji konsultasi Anda untuk besok.',
            icon: Icons.person_outline,
            time: '10:15',
            isUnread: true,
          ),
          
          _buildSectionHeader('SEBELUMNYA'),
          _buildNotificationItem(
            title: 'Pesan Baru',
            message: 'Anda telah menerima pesan baru dari Admin, ketuk untuk membaca selengkapnya.',
            icon: Icons.chat_bubble_outline,
            time: 'Kemarin',
          ),
          _buildNotificationItem(
            title: 'Artikel Menarik',
            message: 'Yuk, Coba Pengembangan Diri Untuk Meningkatkan Produktivitas Kerja.',
            icon: Icons.article_outlined,
            time: '2 hari yang lalu',
          ),
        ],
      ),
    );
  }
}