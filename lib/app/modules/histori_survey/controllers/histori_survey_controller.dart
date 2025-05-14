import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyItem {
  final String id;
  final String title;
  final String category;
  final Color categoryColor;
  final Color backgroundColor;
  final String dateCompleted;
  final int questionCount;
  final IconData categoryIcon;

  SurveyItem({
    required this.id,
    required this.title,
    required this.category,
    required this.categoryColor,
    required this.backgroundColor,
    required this.dateCompleted,
    required this.questionCount,
    required this.categoryIcon,
  });
}

class HistoriSurveyController extends GetxController {
  var selectedTab = 0.obs;
  var selectedDate = DateTime.now().obs;
  
  final surveys = <SurveyItem>[
    SurveyItem(
      id: '1',
      title: 'Temukan Potensimu',
      category: 'Bakat & Minat',
      categoryColor: Colors.blue,
      backgroundColor: Color(0xFFE0E9FF),
      dateCompleted: '10 Jan 2024',
      questionCount: 20,
      categoryIcon: Icons.lightbulb_outline,
    ),
    SurveyItem(
      id: '2',
      title: 'Self-Care',
      category: 'Mental',
      categoryColor: Colors.purple,
      backgroundColor: Color(0xFFF9E0FF),
      dateCompleted: '10 Jan 2024',
      questionCount: 20,
      categoryIcon: Icons.self_improvement,
    ),
    SurveyItem(
      id: '3',
      title: 'Siapakah Anda?',
      category: 'Kepribadian',
      categoryColor: Colors.green,
      backgroundColor: Color(0xFFE0FFEA),
      dateCompleted: '10 Jan 2024',
      questionCount: 20,
      categoryIcon: Icons.person_outline,
    ),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    // Here you would typically filter surveys based on the selected date
    // For example, call an API to fetch surveys for the specific date
    // or filter the local list if you already have all data
    update();
  }

  void openDatePicker() async {
    final DateTime? picked = await Get.dialog(
      Dialog(
        child: Container(
          height: 300,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Tanggal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: selectedDate.value,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  onDateChanged: (date) {
                    selectDate(date);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    if (picked != null) {
      selectDate(picked);
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    // Initialize data or fetch from API when controller is initialized
    // fetchSurveys();
  }
  
  // Example method to fetch surveys from API
  /*
  void fetchSurveys() async {
    try {
      // Show loading indicator
      // final response = await apiClient.getSurveys();
      // surveys.assignAll(response);
    } catch (e) {
      // Handle error
      print('Error fetching surveys: $e');
    } finally {
      // Hide loading indicator
    }
  }
  */
}