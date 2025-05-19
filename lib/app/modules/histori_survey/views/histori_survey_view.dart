import 'package:flutter/material.dart';

class HistoriSurveyView extends StatelessWidget {
  const HistoriSurveyView({super.key});

  final Color primaryColor = const Color(0xFF00A991);

  // Data dummy
  final List<Map<String, String>> surveyList = const [
    {
      "judul": "Survey Kepedulian Lingkungan",
      "tanggal": "12 Mei 2025",
    },
    {
      "judul": "Survey Kesehatan Mental",
      "tanggal": "10 Mei 2025",
    },
    {
      "judul": "Survey Pola Belajar Siswa",
      "tanggal": "5 Mei 2025",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: surveyList.length,
      itemBuilder: (context, index) {
        final item = surveyList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 18),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.05),
                  border: Border.all(color: primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.assignment_outlined, color: primaryColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["judul"] ?? "-",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["tanggal"] ?? "-",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
