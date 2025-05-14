import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/histori_survey_controller.dart';

class HistoriSurveyView extends StatelessWidget {
  final HistoriSurveyController controller = Get.find<HistoriSurveyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            _buildFilterSection(),
            Expanded(
              child: Obx(() => controller.selectedTab.value == 0 
                ? _buildArticleList() 
                : _buildSurveyList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.black87),
          ),
          SizedBox(width: 16),
          Text(
            'Riwayat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Obx(() => Row(
        children: [
          _buildTabItem('Artikel', 0),
          _buildTabItem('Survey', 1),
        ],
      )),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: controller.selectedTab.value == index 
                    ? Colors.teal 
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: controller.selectedTab.value == index 
                  ? Colors.teal 
                  : Colors.grey,
              fontWeight: controller.selectedTab.value == index 
                  ? FontWeight.w600 
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pilih berdasarkan tanggal',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: () => controller.openDatePicker(),
            child: Icon(
              Icons.calendar_today,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleList() {
    return Center(
      child: Text(
        'Daftar Artikel',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSurveyList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: controller.surveys.length,
      itemBuilder: (context, index) {
        final survey = controller.surveys[index];
        return _buildSurveyCard(survey);
      },
    );
  }

  Widget _buildSurveyCard(SurveyItem survey) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: survey.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: survey.backgroundColor,
                    border: Border.all(
                      color: survey.categoryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        survey.categoryIcon,
                        size: 16,
                        color: survey.categoryColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        survey.category,
                        style: TextStyle(
                          color: survey.categoryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  survey.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${survey.questionCount}+ pertanyaan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  survey.dateCompleted,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.edit_note,
                    color: Colors.black54,
                    size: 20,
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