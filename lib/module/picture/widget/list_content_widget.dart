import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListContentWidget extends StatelessWidget {
  final Map<String, dynamic> picture;

  const ListContentWidget({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Pindah ke halaman detail gambar
        Get.toNamed('/detail', arguments: picture['id']);
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Image.network(
              picture['download_url'],
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                picture['author'] ?? 'Unknown',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam
              ),
            ),
          ],
        ),
      ),
    );
  }
}
