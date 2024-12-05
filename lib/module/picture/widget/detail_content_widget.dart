import 'package:flutter/material.dart';

class DetailContentWidget extends StatelessWidget {
  final Map<String, dynamic> pictureDetail;

  const DetailContentWidget({Key? key, required this.pictureDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Menambahkan padding untuk jarak yang baik
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menjaga teks di kiri
        children: [
          // Menampilkan gambar dengan URL yang diterima dari API
          Image.network(
            pictureDetail['download_url'],
            height: 250, // Menurunkan ukuran gambar untuk mengurangi jarak
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15), // Menambahkan jarak yang lebih kecil antara gambar dan teks
          // Teks berwarna hitam dan tidak di tengah
          Text(
            pictureDetail['author'] ?? 'Unknown',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
