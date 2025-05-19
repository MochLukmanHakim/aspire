import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/histori_artikel_controller.dart';
import '../../histori_survey/controllers/histori_survey_controller.dart';
import '../../histori_survey/views/histori_survey_view.dart';
import '../../home/views/home_view.dart';

class HistoriArtikelView extends StatefulWidget {
  const HistoriArtikelView({super.key});

  @override
  State<HistoriArtikelView> createState() => _HistoriArtikelViewState();
}

class _HistoriArtikelViewState extends State<HistoriArtikelView> {
  int selectedTab = 0;
  DateTime selectedDate = DateTime.now();
  final Color primaryColor = const Color(0xFF00A991);
  final Color backgroundColor = const Color(0xFFFAFEFC);

  final historiSurveyController = Get.put(HistoriSurveyController());
  final historiArtikelController = Get.put(HistoriArtikelController());

  void _changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: backgroundColor,
              onSurface: Colors.black87,
            ),
            dialogBackgroundColor: backgroundColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Riwayat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.offAll(() => HomeView()), // ganti halaman ke Home
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
                _tabButton("Survey", 1),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.filter_list, size: 16, color: primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Pilih berdasarkan tanggal",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.calendar_today_outlined, size: 18, color: primaryColor),
                    onPressed: () => _selectDate(context),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                ),
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
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: 2,
      itemBuilder: (context, index) => _articleItem(),
    );
  }

  Widget _articleItem() {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              border: Border.all(color: primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.lightbulb_outline, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yuk, Coba Pengembangan Diri Untuk Menggali ...",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Artikel Pengembangan Diri",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "24",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    height: 1,
                  ),
                ),
                Text(
                  "Rabu",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "Jan 2069",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
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
