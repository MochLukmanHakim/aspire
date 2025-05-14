import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Aspire Counseling Center",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A5144),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0A5144),
          secondary: const Color(0xFF0A5144),
        ),
      ),
    ),
  );
}