import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/detail_picture_controller.dart';
import 'package:mini_project/module/picture/widget/detail_content_widget.dart';

class DetailPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ID gambar yang dikirimkan melalui argumen
    final dynamic pictureIdArg = Get.arguments;  // ID gambar yang dikirimkan
    
    // Coba mengonversi ID gambar ke integer
    final int pictureId = int.tryParse(pictureIdArg?.toString() ?? '0') ?? 0;

    // Menggunakan controller
    final DetailPictureController controller = Get.put(DetailPictureController());

    // Meminta controller untuk mengambil data detail gambar
    controller.fetchPictureDetail(pictureId);

    return Scaffold(
      // Mengubah background AppBar menjadi warna putih dengan teks berwarna hitam
      appBar: AppBar(
        title: Text(
          "Picture Detail",
          style: TextStyle(color: Colors.black), // Teks berwarna hitam
        ),
        backgroundColor: Colors.white, // Latar belakang AppBar menjadi putih
        iconTheme: IconThemeData(color: Colors.black), // Mengubah warna ikon menjadi hitam
      ),
      body: GetX<DetailPictureController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.pictureDetail.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            // Pastikan tipe data yang diteruskan adalah Map<String, dynamic>
            var pictureDetail = Map<String, dynamic>.from(controller.pictureDetail.value);
            return DetailContentWidget(pictureDetail: pictureDetail); // Menampilkan detail gambar
          }
        },
      ),
    );
  }
}
