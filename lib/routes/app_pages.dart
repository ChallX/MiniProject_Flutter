import 'package:get/get.dart';
import 'package:mini_project/core.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    // Route untuk halaman list gambar
    GetPage(
      name: Routes.PHOTOS, 
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    
    // Route untuk halaman detail gambar
    GetPage(
      name: Routes.DETAIL, 
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
