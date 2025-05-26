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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                children: [
                  Container(
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
  child: InkWell(
    onTap: () => Get.back(), // atau Navigator.pop(context)
    child: Icon(
      Icons.arrow_back_ios_new,
      color: theme.colorScheme.primary,
      size: 18,
    ),
  ),
),

                  const SizedBox(width: 16),
                  Text(
                    'Survey',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  Container(
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
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: theme.colorScheme.primary,
                          size: 18,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(() {
                return Wrap(
                  spacing: 12,
                  children: filters.map((filter) {
                    final isSelected = selectedFilter.value == filter;
                    return ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (_) => selectedFilter.value = filter,
                      selectedColor: const Color(0xFFB8E6D3),
                      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    );
                  }).toList(),
                );
              }),
            ),

            const SizedBox(height: 16),

            // Survey Cards (with Expanded placed correctly)
            Obx(() {
              final surveys = getFilteredSurveys(selectedFilter.value);
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
