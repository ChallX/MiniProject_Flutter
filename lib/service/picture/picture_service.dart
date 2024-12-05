import 'package:dio/dio.dart';

class PictureService {
  static final dio = Dio();

  static String apiHostUrl = "https://picsum.photos";

  // Fungsi untuk mengambil list gambar
  static Future<List<Map<String, dynamic>>> index({int page = 1, int limit = 10}) async {
    String url = "v2/list";
    try {
      final response = await dio.get(
        "$apiHostUrl/$url",
        queryParameters: {"page": page, "limit": limit},
      );
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Failed to load pictures');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // Fungsi untuk mengambil detail gambar berdasarkan ID
  static Future<Map<String, dynamic>> show(int id) async {
    String url = "id/$id/info";
    try {
      final response = await dio.get("$apiHostUrl/$url");
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else {
        throw Exception('Failed to load picture details');
      }
    } catch (e) {
      throw Exception('Error fetching picture details: $e');
    }
  }
}
