import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/detail_picture_controller.dart';
import 'package:mini_project/module/picture/controller/list_picture_controller.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPictureController>(() => ListPictureController());
    Get.lazyPut<DetailPictureController>(() => DetailPictureController());
  }
}
