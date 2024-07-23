import 'package:dio/dio.dart';

class PokeTesteHttpRepository {
  final dio = Dio();
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
