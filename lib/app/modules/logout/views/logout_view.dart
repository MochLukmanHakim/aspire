import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB), // Light mint green background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon logout
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.logout_rounded,
                  size: 32,
                  color: Colors.red.shade600,
                ),
              ),
              
              const SizedBox(height: 16),
              
              const Text(
                'Apakah Anda Yakin Ingin\nKeluar Dari Akun Anda?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Anda akan diarahkan kembali ke halaman login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.2,
                ),
              ),
              
              const SizedBox(height: 32),
                             
              // Tidak Sekarang button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF64B6AC),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Tidak Sekarang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64B6AC),
                    ),
                  ),
                ),
              ),
                             
              const SizedBox(height: 12),
                             
              // Logout button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Tutup dialog
                    Navigator.of(context).pop();
                    
                    // Tampilkan loading indicator sebentar
                    Get.dialog(
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircularProgressIndicator(
                                color: Color(0xFF64B6AC),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Logging out...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    );
                    
                    // Delay sebentar untuk efek loading
                    Future.delayed(const Duration(seconds: 1), () {
                      // Tutup loading dialog
                      Get.back();
                      
                      // Navigasi ke halaman login dan hapus semua route sebelumnya
                      Get.offAllNamed('/login');
                      
                      // Tampilkan snackbar konfirmasi logout
                      Get.snackbar(
                        'Logout Berhasil',
                        'Anda telah keluar dari akun',
                        backgroundColor: Colors.green.shade100,
                        colorText: Colors.green.shade800,
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 2),
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
                             
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    },
  );
}

// Alternatif fungsi logout tanpa loading dialog (lebih sederhana)
void showSimpleLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: [
            Icon(
              Icons.logout_rounded,
              color: Colors.red.shade600,
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Konfirmasi Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari akun?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              
              // Langsung navigasi ke login
              Get.offAllNamed('/login');
              
              // Tampilkan snackbar
              Get.snackbar(
                'Logout Berhasil',
                'Sampai jumpa lagi!',
                backgroundColor: Colors.green.shade100,
                colorText: Colors.green.shade800,
                snackPosition: SnackPosition.TOP,
                duration: const Duration(seconds: 2),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    },
  );
}