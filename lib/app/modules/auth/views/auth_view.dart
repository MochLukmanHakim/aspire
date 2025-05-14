import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFF7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormField('Nama Lengkap', controller.fullNameController),
                  _buildFormField('Email', controller.emailController),
                  _buildPhoneField(),
                  _buildFormField('NIS', controller.nisController),
                  _buildPasswordField(),
                  _buildConfirmPasswordField(),
                  const SizedBox(height: 20),
                  _buildRegisterButton(),
                  const SizedBox(height: 16),
                  _buildLoginLink(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildTopSection() {
  return Stack(
    children: [
      SizedBox(
        height: Get.height * 0.40, // Sama seperti di LoginView
        width: double.infinity,
        child: Image.asset(
          'assets/images/header.png',
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.groups, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                'Aspire',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'BUAT AKUN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

  Widget _buildFormField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF5E3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nomor Telephone', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF5E3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              prefixText: '+62 ',
              prefixStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return _buildObxPasswordField(
      label: 'Password',
      controller: controller.passwordController,
      isVisible: controller.isPasswordVisible,
      toggleVisibility: controller.togglePasswordVisibility,
    );
  }

  Widget _buildConfirmPasswordField() {
    return _buildObxPasswordField(
      label: 'Confirm Password',
      controller: controller.confirmPasswordController,
      isVisible: controller.isConfirmPasswordVisible,
      toggleVisibility: controller.toggleConfirmPasswordVisibility,
    );
  }

  Widget _buildObxPasswordField({
    required String label,
    required TextEditingController controller,
    required RxBool isVisible,
    required VoidCallback toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF5E3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Obx(() => TextField(
            controller: controller,
            obscureText: !isVisible.value,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: toggleVisibility,
              ),
            ),
          )),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: controller.register,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC727),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          'Registrasi',
          style: TextStyle(
            color: Color(0xFF0D5349),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sudah punya akun? ', style: TextStyle(fontSize: 14)),
        GestureDetector(
          onTap: () => Get.toNamed('/login'),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
