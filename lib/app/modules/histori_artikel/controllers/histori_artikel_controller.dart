import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryItem {
  final String title;
  final DateTime date;
  final String type; // "article" or "survey"
  final IconData icon;

  HistoryItem({
    required this.title,
    required this.date,
    required this.type,
    required this.icon,
  });
}

class HistoriArtikelController extends GetxController {
  var selectedTab = 'article'.obs;
  var showDatePicker = false.obs;
  var selectedDate = DateTime.now().obs;
  
  final historyItems = <HistoryItem>[
    HistoryItem(
      title: 'Yuk, Coba Pengembangan Diri Untuk Menggali ...',
      date: DateTime(2069, 1, 24),
      type: 'article',
      icon: Icons.article,
    ),
    HistoryItem(
      title: 'Yuk, Coba Pengembangan Diri Untuk Menggali ...',
      date: DateTime(2069, 1, 24),
      type: 'article',
      icon: Icons.article,
    ),
    // Add more dummy data here
    HistoryItem(
      title: 'Cara Meningkatkan Produktivitas Dalam Bekerja',
      date: DateTime(2069, 1, 20),
      type: 'article',
      icon: Icons.article,
    ),
    HistoryItem(
      title: 'Teknik Relaksasi untuk Mengatasi Stres',
      date: DateTime(2069, 1, 15),
      type: 'article',
      icon: Icons.article,
    ),
    HistoryItem(
      title: 'Feedback Tentang Aplikasi Kami',
      date: DateTime(2069, 1, 18),
      type: 'survey',
      icon: Icons.poll,
    ),
    HistoryItem(
      title: 'Survey Kepuasan Pengguna 2069',
      date: DateTime(2069, 1, 10),
      type: 'survey',
      icon: Icons.poll,
    ),
  ].obs;

  List<HistoryItem> get filteredItems {
    return historyItems
      .where((item) => item.type == selectedTab)
      .toList();
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void toggleDatePicker() {
    showDatePicker.value = !showDatePicker.value;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    showDatePicker.value = false;
    // Here you would typically filter your items based on the selected date
    update();
  }

  void resetDateFilter() {
    selectedDate.value = DateTime.now();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // You could fetch history items from an API or local database here
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}