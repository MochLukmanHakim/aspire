import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C6B4F), // Primary green background color
      body: Stack(
        children: [
          // Cloud background image at the top
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/background_awan.png',
              width: 550,
              fit: BoxFit.contain,
            ),
          ),
          
          // Main content with safe area
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProfileSection(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSectionTitle('Data Diri'),
                                  SizedBox(height: 24),
                                  _buildFormFields(),
                                  SizedBox(height: 30),
                                  _buildSaveButton(),
                                  SizedBox(height: 30),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              SizedBox(width: 16),
              Text(
                'Profil Saya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Obx(() {
                final path = controller.profileImagePath.value;
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        spreadRadius: 3,
                        offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(color: Colors.white, width: 4),
                    image: path != null
                        ? DecorationImage(
                            image: path.startsWith('assets/images/user.png')
                                ? AssetImage(path)
                                : FileImage(File(path)) as ImageProvider,
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: path == null
                      ? Icon(Icons.person, size: 65, color: Colors.grey.shade400)
                      : null,
                );
              }),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // Implementasi pemilihan foto
                    controller.changeProfileImage('assets/images/user.png');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF0C6B4F),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 22),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Obx(() => Text(
                controller.fullName.value.isEmpty ? 'Nama Pengguna' : controller.fullName.value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              )),
          SizedBox(height: 4),
          Obx(() => Text(
                controller.username.value.isEmpty ? '@username' : '@${controller.username.value}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Color(0xFF0C6B4F), width: 3),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildFormField(
          label: 'Nama Lengkap',
          icon: Icons.person_outline,
          initialValue: controller.fullName.value,
          onChanged: (val) => controller.fullName.value = val,
        ),
        _buildFormField(
          label: 'Nama Pengguna',
          icon: Icons.alternate_email,
          initialValue: controller.username.value,
          onChanged: (val) => controller.username.value = val,
        ),
        _buildFormField(
          label: 'NIS',
          icon: Icons.badge_outlined,
          initialValue: controller.nis.value,
          onChanged: (val) => controller.nis.value = val,
        ),
        _buildFormField(
          label: 'No Telephone',
          icon: Icons.phone_outlined,
          initialValue: controller.phoneNumber.value,
          onChanged: (val) => controller.phoneNumber.value = val,
          keyboardType: TextInputType.phone,
        ),
        _buildFormField(
          label: 'Email',
          icon: Icons.email_outlined,
          initialValue: controller.email.value,
          onChanged: (val) => controller.email.value = val,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required IconData icon,
    required String initialValue,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              keyboardType: keyboardType,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Masukkan $label',
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                prefixIcon: Icon(icon, color: Color(0xFF0C6B4F)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xFF0C6B4F), width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$label tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF0C6B4F).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0C6B4F),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            controller.saveProfile();
            Get.snackbar(
              'Berhasil',
              'Profil berhasil diperbarui',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Color(0xFF0C6B4F),
              colorText: Colors.white,
              margin: EdgeInsets.all(16),
              borderRadius: 16,
              duration: Duration(seconds: 2),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 24),
            SizedBox(width: 10),
            Text(
              'Simpan Perubahan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}