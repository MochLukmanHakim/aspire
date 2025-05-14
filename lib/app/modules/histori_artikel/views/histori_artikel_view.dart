import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/histori_artikel_controller.dart';

class HistoriArtikelView extends GetView<HistoriArtikelController> {
  const HistoriArtikelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabs(),
            _buildDateFilter(),
            Expanded(
              child: Obx(() => _buildHistoryList()),
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
          InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          SizedBox(width: 32),
          Text(
            'Riwayat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() => Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildTabItem('Artikel', 'article'),
          _buildTabItem('Survey', 'survey'),
        ],
      ),
    ));
  }

  Widget _buildTabItem(String title, String tabId) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.changeTab(tabId),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: TextStyle(
                  color: controller.selectedTab.value == tabId
                      ? Colors.teal
                      : Colors.grey,
                  fontWeight: controller.selectedTab.value == tabId
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 3,
              color: controller.selectedTab.value == tabId
                  ? Colors.teal
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            'Pilih berdasarkan tanggal',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () => _showDatePickerDialog(),
            child: Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }

  void _showDatePickerDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Pilih Tanggal'),
        content: Container(
          height: 300,
          width: 300,
          child: CalendarDatePicker(
            initialDate: controller.selectedDate.value,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (date) {
              controller.selectDate(date);
              Get.back();
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.resetDateFilter();
              Get.back();
            },
            child: Text('RESET'),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('BATAL'),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    final items = controller.filteredItems;
    
    if (items.isEmpty) {
      return Center(
        child: Text('Tidak ada riwayat untuk ditampilkan'),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildHistoryItem(item);
      },
    );
  }

  Widget _buildHistoryItem(HistoryItem item) {
    // Custom date formatting without intl package
    final day = item.date.day.toString();
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
    final month = months[item.date.month - 1];
    final year = item.date.year.toString();
    
    // Indonesian weekday names
    final weekdays = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    // Convert DateTime weekday (1-7 where 1 is Monday) to index for our array (0-6)
    final weekdayIndex = (item.date.weekday - 1) % 7;
    final weekday = weekdays[weekdayIndex];
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.teal),
            ),
            child: Icon(item.icon, color: Colors.teal),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Text(
                weekday,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                '$month $year',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}