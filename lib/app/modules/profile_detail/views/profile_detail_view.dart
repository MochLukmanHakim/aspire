import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetailView> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController(text: "MOCH. LUKMAN HAKIM");
  final _nisController = TextEditingController(text: "0012345");
  final _namaPenggunaController = TextEditingController(text: "Manmaan");
  final _noTelephoneController = TextEditingController(text: "+62 123 4567 8912");
  final _emailController = TextEditingController(text: "Lukmanhakim2828@Gmail.Com");

  bool _isLoading = false;

  @override
  void dispose() {
    _namaLengkapController.dispose();
    _nisController.dispose();
    _namaPenggunaController.dispose();
    _noTelephoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A6352),
      body: SafeArea(
        child: Stack(
          children: [
            // Background putih yang sesuai dengan Profile View
            Positioned(
              top: 149,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
              ),
            ),

            // Konten utama
            Column(
              children: [
                // Header
                _buildHeader(),
                
                // Form content dengan padding yang sama seperti Profile View
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 120, 24, 24), // Same as Profile View
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Spacer untuk ruang foto profil
                          const SizedBox(height: 40),
                          
                          // Form Title
                          const Text(
                            "Edit Profil",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Perbarui informasi profil Anda",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Form Fields - Nama Lengkap (full width)
                          _buildFormField(
                            label: "Nama Lengkap",
                            controller: _namaLengkapController,
                            hint: "Masukkan nama lengkap",
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Nama lengkap tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // NIS (full width - tidak bersebelahan)
                          _buildFormField(
                            label: "NIS",
                            controller: _nisController,
                            hint: "Masukkan NIS",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "NIS tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Nama Pengguna (full width - tidak bersebelahan)
                          _buildFormField(
                            label: "Nama Pengguna",
                            controller: _namaPenggunaController,
                            hint: "Masukkan username",
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Username tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 16),
                          
                          _buildFormField(
                            label: "No Telephone",
                            controller: _noTelephoneController,
                            hint: "Masukkan nomor telephone",
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Nomor telephone tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 16),
                          
                          _buildFormField(
                            label: "Email",
                            controller: _emailController,
                            hint: "Masukkan email",
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Email tidak boleh kosong";
                              }
                              if (!GetUtils.isEmail(value!)) {
                                return "Format email tidak valid";
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Save Button
                          _buildSaveButton(),
                          
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Foto profil yang fixed (sama seperti Profile View)
            Positioned(
              top: 90, // Posisi dari atas sama dengan Profile View
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Foto profil dengan styling yang sama
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Profile Image dengan ukuran yang sama
                      const CircleAvatar(
                        radius: 63,
                        backgroundColor: Color(0xFFF9FAFB),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                      // Overlay dengan camera icon
                      GestureDetector(
                        onTap: () {
                          _showImagePickerOptions();
                        },
                        child: Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt, 
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
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
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF2A6352),
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            "Edit Profil",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // warna bayangan
                spreadRadius: 1, // sebaran bayangan
                blurRadius: 3,   // seberapa blur
                offset: const Offset(0, 2), // posisi bayangan (x, y)
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 13,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF2A6352),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _saveProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2A6352),
          disabledBackgroundColor: const Color(0xFF2A6352).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                "Simpan Perubahan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pilih Foto Profil",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageOption(
                  icon: Icons.camera_alt,
                  label: "Kamera",
                  onTap: () {
                    Get.back();
                    // Implement camera functionality
                  },
                ),
                _buildImageOption(
                  icon: Icons.photo_library,
                  label: "Galeri",
                  onTap: () {
                    Get.back();
                    // Implement gallery functionality
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF2A6352).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2A6352),
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Show success message
    Get.snackbar(
      "Berhasil",
      "Profil berhasil diperbarui",
      backgroundColor: const Color(0xFF2A6352),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );

    // Navigate back
    Get.back();
  }
}