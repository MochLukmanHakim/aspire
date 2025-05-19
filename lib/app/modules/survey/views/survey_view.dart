import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyView extends StatelessWidget {
  SurveyView({super.key});

  final filters = ['Semua Tes', 'Bakat & Minat', 'Mental', 'Kepribadian', 'Sosial'];
  final selectedFilter = 'Semua Tes'.obs;

  final allSurveys = [
    {
      "category": "Bakat & Minat",
      "title": "Temukan Potensimu",
      "color": const Color(0xFFD9F1FF),
      "image": "assets/images/survey1.png"
    },
    {
      "category": "Mental",
      "title": "Self-Care",
      "color": const Color(0xFFFDD7F5),
      "image": "assets/images/survey2.png"
    },
    {
      "category": "Kepribadian",
      "title": "Siapakah Anda?",
      "color": const Color(0xFFB8EED8),
      "image": "assets/images/survey3.png"
    },
    {
      "category": "Sosial",
      "title": "Bagaimana Kamu?",
      "color": const Color(0xFFFFE3B2),
      "image": "assets/images/survey4.png"
    },
  ];

  List<Map<String, dynamic>> getFilteredSurveys(String selected) {
    if (selected == 'Semua Tes') return allSurveys;
    return allSurveys.where((s) => s['category'] == selected).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFFBF4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("Survey", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () => Get.toNamed('/notifikasi'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            Obx(() {
              return Wrap(
                spacing: 12,
                children: filters.map((filter) {
                  final isSelected = selectedFilter.value == filter;
                  return ChoiceChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (_) => selectedFilter.value = filter,
                    selectedColor: const Color(0xFFB8E6D3),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 16),

            // Survey Cards
            Obx(() {
              final surveys = getFilteredSurveys(selectedFilter.value);
              return Expanded(
                child: ListView.builder(
                  itemCount: surveys.length,
                  itemBuilder: (context, index) {
                    final survey = surveys[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: survey["color"],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Chip(
                                  label: Text(survey["category"]),
                                  backgroundColor: Colors.white,
                                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  survey["title"],
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                const Text("20+ pertanyaan"),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            survey["image"],
                            width: 72,
                            height: 72,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
