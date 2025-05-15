import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'Manmaan'.obs;
  final nis = '0012345'.obs;

  void logout() {
    Get.snackbar("Logout", "Berhasil logout");
  }
}

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController()); // ❗ Tidak bisa digunakan dalam const constructor

  ProfileView({super.key}); // ✅ Hapus const agar tidak error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: const Color(0xFF0D4D4D),
              child: Column(
                children: [
                  Row(
                    children: const [
                      BackButton(color: Colors.white),
                      Spacer(),
                      Text(
                        "Profil",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Text(
                        controller.userName.value,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Obx(() => Text(
                        'NIS : ${controller.nis.value}',
                        style: const TextStyle(color: Colors.white70),
                      )),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: Container(
                color: const Color(0xFFF1FBF4),
                child: ListView(
                  children: [
                    buildMenuItem(
                      icon: Icons.person,
                      color: Colors.orange,
                      title: 'Edit Profile',
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: Icons.bookmark,
                      color: Colors.pink,
                      title: 'Favorit Saya',
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: Icons.settings,
                      color: Colors.green,
                      title: 'Pengaturan',
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: Icons.support_agent,
                      color: Colors.blue,
                      title: 'Hubungi Kami',
                      onTap: () {},
                    ),
                    buildMenuItem(
                      icon: Icons.logout,
                      color: Colors.blueAccent,
                      title: 'Logout',
                      onTap: controller.logout,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
