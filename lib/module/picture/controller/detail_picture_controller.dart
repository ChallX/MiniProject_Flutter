import 'package:get/get.dart';
import 'package:mini_project/service/picture/picture_service.dart';

class DetailPictureController extends GetxController {
  var pictureDetail = {}.obs;
  var isLoading = true.obs;

  void fetchPictureDetail(int id) async {
    isLoading.value = true;
    try {
      var detail = await PictureService.show(id);
      pictureDetail.value = Map<String, dynamic>.from(detail);  // Pastikan data yang diterima adalah Map<String, dynamic>
    } catch (e) {
      print("Error fetching picture detail: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
