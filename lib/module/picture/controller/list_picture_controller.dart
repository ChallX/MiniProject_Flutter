import 'package:get/get.dart';
import 'package:mini_project/service/picture/picture_service.dart';

class ListPictureController extends GetxController {
  var isLoading = true.obs;  // Status loading
  var isError = false.obs;   // Status error
  var dataPictures = <Map<String, dynamic>>[].obs; // Data gambar

  @override
  void onInit() {
    super.onInit();
    getPictures();  // Pastikan pemanggilan getPictures ketika controller inisialisasi
  }

  // Fungsi untuk mengambil list gambar
  Future<void> getPictures() async {
    try {
      var listPictures = await PictureService.index(); // Memanggil API untuk gambar
      dataPictures.assignAll(listPictures); // Update data gambar
      isLoading.value = false;  // Mengubah status loading
      isError.value = false;    // Menandakan tidak ada error
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
      print('Error fetching pictures: $e');
    }
  }

  // Fungsi untuk merubah status loading secara manual
  void changeLoading() {
    isLoading.value = false;
  }
}
