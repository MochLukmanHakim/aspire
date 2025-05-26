
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../chat/views/chat_view.dart';
import '../../chat_riwayat/views/chat_riwayat_view.dart'; // Tambahkan import ini
import '../../notifikasi/views/notifikasi_view.dart';
import '../../histori_artikel/views/histori_artikel_view.dart';
import '../../home/controllers/home_controller.dart';

class PesanView extends StatelessWidget {
  PesanView({Key? key}) : super(key: key);

  // Color scheme
  static const Color primaryColor = Color(0xFF2A6352);
  static const Color secondaryColor = Color(0xFF64B6AC);
  static const Color tertiaryColor = Color(0xFFD9FFF8);
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color surfaceColor = Colors.white;

  // Pesan untuk sesi berlangsung
  final List<Map<String, dynamic>> sesiBerlangsung = [
    {
      "name": "Bpk. Rahmat S.Pd",
      "subtitle": "Sedang dalam sesi konseling...",
      "time": "Sekarang",
      "imageUrl": "assets/images/konselor1.png",
      "unread": true,
      "isActive": true,
    },
  ];

  // Riwayat konsultasi (sebelumnya sesi berakhir)
  final List<Map<String, dynamic>> riwayatKonsultasi = [
    {
      "name": "Bu. Sujiati S.Pd",
      "subtitle": "Jangan lupa untuk mengerjakan tugas yang diberikan 😊",
      "time": "Kemarin",
      "lastConsultation": "23 Mei 2025",
      "imageUrl": "assets/images/konselor2.png",
      "unread": false,
      "isActive": false,
      "totalSessions": 2,
    },
    {
      "name": "Bpk. Ahmad Supriyadi",
      "subtitle": "Berikut adalah materi tambahan untuk dipelajari...",
      "time": "23 Mar",
      "lastConsultation": "23 Maret 2025",
      "imageUrl": "assets/images/konselor3.png",
      "unread": false,
      "isActive": false,
      "totalSessions": 2,
    },
    {
      "name": "Ibu. Sari Indah",
      "subtitle": "Bagaimana kabar Anda hari ini?",
      "time": "18 Mar",
      "lastConsultation": "18 Maret 2025",
      "imageUrl": "assets/images/konselor4.png",
      "unread": false,
      "isActive": false,
      "totalSessions": 2,
    },
    {
      "name": "Bpk. Budi Santoso",
      "subtitle": "Sesi konseling minggu depan dijadwalkan ulang",
      "time": "01 Feb",
      "lastConsultation": "1 Februari 2025",
      "imageUrl": "assets/images/konselor5.png",
      "unread": false,
      "isActive": false,
      "totalSessions": 1,
    },
  ];

  // Fungsi untuk navigasi berdasarkan nama konselor
  void _navigateToChat(String konselorName) {
    if (konselorName.contains("Rahmat")) {
      // Jika nama mengandung "Rahmat", pergi ke ChatView
      Get.to(() => ChatView());
    } else {
      // Selain Rahmat, pergi ke ChatRiwayatView
      Get.to(() => ChatRiwayatView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildSearchBar(),
            const SizedBox(height: 20),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sesi Berlangsung Section
                    if (sesiBerlangsung.isNotEmpty) ...[
                      _buildSectionHeader("Sesi Berlangsung",""),
                      const SizedBox(height: 8),
                      _buildMessageSection(sesiBerlangsung, isHistory: false),
                      const SizedBox(height: 24),
                    ],
                    
                    // Riwayat Konsultasi Section
                    _buildSectionHeader("Riwayat Konsultasi",""),
                    const SizedBox(height: 8),
                    _buildMessageSection(riwayatKonsultasi, isHistory: true),
                    const SizedBox(height: 100), // Space for FAB
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewMessageDialog(context);
        },
        backgroundColor: primaryColor,
        elevation: 6,
        child: const Icon(Icons.add_comment_rounded, color: Colors.white),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Text(
            "Pesan",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
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
        print('Logout dipilih');
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
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 54,
        decoration: BoxDecoration(
          color: surfaceColor,
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
          decoration: InputDecoration(
            hintText: 'Cari pesan...',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: primaryColor,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            child: const Row(
             
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageSection(List<Map<String, dynamic>> messageList, {required bool isHistory}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        final pesan = messageList[index];
        return GestureDetector(
          onTap: () => _navigateToChat(pesan['name']!), // Gunakan fungsi navigasi bersyarat
          child: isHistory 
            ? HistoryTile(
              name: pesan['name']!,
              subtitle: pesan['subtitle']!,
              time: pesan['time']!,
              lastConsultation: pesan['lastConsultation']!,
              totalSessions: pesan['totalSessions']!,
              imageUrl: pesan['imageUrl']!,
              unread: pesan['unread'],
              isActive: pesan['isActive'] ?? false,
            )
            : MessageTile(
              name: pesan['name']!,
              subtitle: pesan['subtitle']!,
              time: pesan['time']!,
              imageUrl: pesan['imageUrl']!,
              unread: pesan['unread'],
              isActive: pesan['isActive'] ?? false,
            ),
        );
      },
    );
  }

  void _showNewMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  surfaceColor,
                  tertiaryColor.withOpacity(0.3),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: tertiaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color:  Color(0xFF2A6352),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Pesan Baru',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih konselor untuk memulai percakapan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          'Batal',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Tutup dialog terlebih dahulu
                          Navigator.of(context).pop();
                          
                          // Kemudian pindah halaman setelah dialog tertutup
                          Future.delayed(const Duration(milliseconds: 100), () {
                            Get.find<HomeController>().changePage(3);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          shadowColor: primaryColor.withOpacity(0.3),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_rounded, size: 20, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Mulai Chat',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ================== KOMPONEN ==================

class MessageTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String time;
  final String imageUrl;
  final bool unread;
  final bool isActive;

  // Color scheme
  static const Color primaryColor = Color(0xFF2A6352);
  static const Color secondaryColor = Color(0xFF64B6AC);
  static const Color tertiaryColor = Color(0xFFD9FFF8);
  static const Color surfaceColor = Colors.white;

  const MessageTile({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.time,
    required this.imageUrl,
    required this.unread,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: unread 
          ? tertiaryColor.withOpacity(0.5)
          : surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: unread 
            ? primaryColor.withOpacity(0.2)
            : Colors.grey.shade100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: unread 
                  ? primaryColor.withOpacity(0.1)
                  : tertiaryColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: tertiaryColor,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ),
            if (isActive)
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            if (unread && !isActive)
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: unread ? FontWeight.bold : FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            if (isActive)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Aktif",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              color: unread ? Colors.black87 : Colors.grey.shade600,
              fontSize: 13,
              fontWeight: unread ? FontWeight.w500 : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: unread ? primaryColor : Colors.grey.shade500,
                fontWeight: unread ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            if (unread)
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
      ),
    );
  }
}

// Komponen baru untuk Riwayat Konsultasi
class HistoryTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String time;
  final String lastConsultation;
  final int totalSessions;
  final String imageUrl;
  final bool unread;
  final bool isActive;

  // Color scheme
  static const Color primaryColor = Color(0xFF2A6352);
  static const Color secondaryColor = Color(0xFF64B6AC);
  static const Color tertiaryColor = Color(0xFFD9FFF8);
  static const Color surfaceColor = Colors.white;

  const HistoryTile({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.time,
    required this.lastConsultation,
    required this.totalSessions,
    required this.imageUrl,
    required this.unread,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Avatar
            Container(
              decoration: BoxDecoration(
                color: tertiaryColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: tertiaryColor,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Sessions Badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "$totalSessions sesi",
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  
                  // Last message
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  
                  // Last consultation info
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Terakhir: $lastConsultation",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}