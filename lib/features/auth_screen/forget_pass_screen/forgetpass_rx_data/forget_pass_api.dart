import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostForgetApi {
  static final PostForgetApi _singleton = PostForgetApi._internal();
  PostForgetApi._internal();
  static PostForgetApi get instance => _singleton;

  Future<Map<String, dynamic>> forgetPass({
    required String email,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
      };
      Response response = await postHttp(Endpoints.forgetPass(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
