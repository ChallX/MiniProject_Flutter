import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/module/picture/controller/list_picture_controller.dart';
import 'package:mini_project/module/picture/widget/list_content_widget.dart';
import 'package:mini_project/shared/widget/loading_widget.dart';

class ListPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengubah AppBar menjadi putih dengan teks hitam
      appBar: AppBar(
        title: Text("Pictures", style: TextStyle(color: Colors.black)), // Teks hitam
        backgroundColor: Colors.white, // Latar belakang putih
        iconTheme: IconThemeData(color: Colors.black), // Ikon hitam
      ),
      body: GetX<ListPictureController>(
        init: ListPictureController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return LoadingWidget();  // Menampilkan loading widget
          } else if (controller.isError.value) {
            return Center(child: Text("Error loading pictures", style: TextStyle(color: Colors.black)));
          } else {
            return ListView.builder(
              itemCount: controller.dataPictures.length,
              itemBuilder: (context, index) {
                var picture = controller.dataPictures[index];
                return ListContentWidget(picture: picture); // Menampilkan konten gambar
              },
            );
          }
        },
      ),
    );
  }
}
