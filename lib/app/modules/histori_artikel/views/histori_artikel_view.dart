import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/histori_artikel_controller.dart';

class HistoriArtikelView extends GetView<HistoriArtikelController> {
  const HistoriArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F5F1),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8F5F1),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Riwayat',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF00C897),
            indicatorWeight: 2,
            tabs: [
              Tab(text: 'Artikel'),
              Tab(text: 'Survey'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            artikelTab(),
            const Center(child: Text("Belum ada data survey")),
          ],
        ),
      ),
    );
  }

  Widget artikelTab() {
    return Column(
      children: [
        const Divider(height: 1, color: Color(0xFFDEE0E3)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Pilih berdasarkan tanggal",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Icon(Icons.calendar_today, size: 20),
            ],
          ),
        ),
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF00C897)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline,
                              color: Color(0xFF00C897),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              controller.data[index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            height: 40,
                            width: 1,
                            color: Colors.amber,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "24",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00C897),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Rabu\nJan 2069",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
