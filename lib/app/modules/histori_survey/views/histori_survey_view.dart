import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriSurveyView extends StatefulWidget {
  const HistoriSurveyView({super.key});

  @override
  State<HistoriSurveyView> createState() => _HistoriSurveyViewState();
}

class _HistoriSurveyViewState extends State<HistoriSurveyView> {
  final Color primaryColor = const Color(0xFF2A6352);
  final Color backgroundColor = const Color(0xFFFAFEFC);

  // Data konselor yang di-bookmark
  List<Map<String, dynamic>> bookmarkedConsultants = [
    {
      'name': 'Bpk. Rahmat',
      'rating': 4.8,
      'terjadwal': '5 orang',
      'availableTime': '09.00 - 15.30',
      'profileImage': 'assets/images/konselor1.png',      'experience': '8 tahun',
      'bookmarkedDate': DateTime(2024, 5, 20),
    
    },
    {
      'name': 'Bu. Sujiati',
      'rating': 4.9,
      'terjadwal': '7 orang',
      'availableTime': '08.00 - 16.00',
      'profileImage': 'assets/images/konselor2.png',
      'experience': '12 tahun',
      'bookmarkedDate': DateTime(2024, 5, 18),
      
    },
    {
      'name': 'Bpk. Ahmad Supriyadi',
      'rating': 4.7,
      'terjadwal': '4 orang',
      'availableTime': '11.00 - 15.00',
      'profileImage': 'assets/images/konselor3.png',
      'experience': '6 tahun',
      'bookmarkedDate': DateTime(2024, 5, 15),
      
    },
    {
      'name': 'Ibu. Sari Indah',
      'rating': 4.7,
      'terjadwal': '4 orang',
      'availableTime': '11.00 - 15.00',
      'profileImage': 'assets/images/konselor4.png',      'experience': '9 tahun',
      'bookmarkedDate': DateTime(2024, 5, 12),
      
    },
    {
      'name': 'Bpk. Budi Santosor',
      'rating': 4.7,
      'terjadwal': '4 orang',
      'availableTime': '11.00 - 15.00',
      'profileImage': 'assets/images/konselor5.png',
      'experience': '10 tahun',
      'bookmarkedDate': DateTime(2024, 5, 10),
      
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (bookmarkedConsultants.isEmpty) {
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
              'Belum ada konselor yang disimpan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Simpan konselor favorit untuk konsultasi nanti',
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

    return Column(
      children: [
        // List konselor
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: bookmarkedConsultants.length,
            itemBuilder: (context, index) {
              final consultant = bookmarkedConsultants[index];
              return _buildConsultantCard(consultant, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConsultantCard(Map<String, dynamic> consultant, BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Profile Image dengan border
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: primaryColor.withOpacity(0.1),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: consultant['profileImage'] != null
                          ? AssetImage(consultant['profileImage'])
                          : null,
                      child: consultant['profileImage'] == null
                          ? Icon(
                              Icons.person,
                              color: primaryColor,
                              size: 30,
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              consultant['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.bookmark,
                                color: primaryColor,
                                size: 18,
                              ),
                            ),
                            onSelected: (value) {
                              if (value == 'remove') {
                                _removeBookmark(consultant);
                              } else if (value == 'share') {
                                _shareConsultant(consultant);
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<String>(
                                value: 'remove',
                                child: Row(
                                  children: [
                                    Icon(Icons.bookmark_remove, size: 18, color: Colors.red),
                                    const SizedBox(width: 8),
                                    Text('Hapus dari Simpanan'),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'share',
                                child: Row(
                                  children: [
                                    Icon(Icons.share, size: 18, color: Colors.grey.shade600),
                                    const SizedBox(width: 8),
                                    Text('Bagikan'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                     
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildInfoChip(
                            icon: Icons.star,
                            label: '${consultant['rating']}',
                            iconColor: Colors.amber,
                            theme: theme,
                          ),
                          const SizedBox(width: 12),
                          _buildInfoChip(
                            icon: Icons.work_outline_rounded,
                            label: consultant['terjadwal'],
                            iconColor: primaryColor,
                            theme: theme,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Available Time Range
                      Row(
                        children: [
                          Text(
                            'Waktu Tersedia:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildTimeRange(consultant['availableTime'], theme),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Pilih tanggal konsultasi',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _selectConsultationDate(context, consultant['name']),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Atur Jadwal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color iconColor,
    required ThemeData theme,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 14,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRange(String timeRange, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        timeRange,
        style: TextStyle(
          fontSize: 11,
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _selectConsultationDate(BuildContext context, String consultantName) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null) {
        Get.snackbar(
          'Jadwal Konsultasi',
          'Jadwal konsultasi dengan $consultantName pada ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          backgroundColor: primaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    });
  }

  void _removeBookmark(Map<String, dynamic> consultant) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus dari Simpanan'),
          content: Text('Apakah Anda yakin ingin menghapus ${consultant['name']} dari simpanan?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bookmarkedConsultants.remove(consultant);
                });
                Navigator.of(context).pop();
                Get.snackbar(
                  'Berhasil',
                  '${consultant['name']} telah dihapus dari simpanan',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: Duration(seconds: 2),
                );
              },
              child: Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _shareConsultant(Map<String, dynamic> consultant) {
    Get.snackbar(
      'Bagikan',
      'Fitur berbagi konselor akan segera tersedia',
      backgroundColor: primaryColor,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

}