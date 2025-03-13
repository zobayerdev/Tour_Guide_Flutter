import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostSignUpApi {
  static final PostSignUpApi _singleton = PostSignUpApi._internal();
  PostSignUpApi._internal();
  static PostSignUpApi get instance => _singleton;

  Future<Map<String, dynamic>> signUpApi({
    required String email,
    required String username,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      // Map<String, dynamic> data = {
      //   "email": email,
      //   "password": password,
      //   "password_confirmation": password_confirmation,
      //   "username": username,
      // };
      FormData data = FormData.fromMap({
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
      });

      Response response = await postHttp(Endpoints.signUp(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Sign Up Successfully");
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
