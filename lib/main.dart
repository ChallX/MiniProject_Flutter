import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/routes/app_pages.dart';  // Pastikan import ini benar

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mini Project', // Judul aplikasi
      getPages: AppPages.routes, // Menggunakan routing yang sudah didefinisikan di app_pages.dart
      initialRoute: Routes.PHOTOS, // Set initial route ke /photos
    );
  }
}
