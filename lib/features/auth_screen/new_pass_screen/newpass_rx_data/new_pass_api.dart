import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostNewPassApi {
  static final PostNewPassApi _singleton = PostNewPassApi._internal();
  PostNewPassApi._internal();
  static PostNewPassApi get instance => _singleton;

  Future<Map<String, dynamic>> resetPass({
    required String email,
    required String otp,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "otp": otp,
        "password": password,
        "password_confirmation": password_confirmation,
      };
      Response response = await postHttp(Endpoints.resetPass(), data);

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
