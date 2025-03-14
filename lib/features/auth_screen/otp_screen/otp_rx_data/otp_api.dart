import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostOTPApi {
  static final PostOTPApi _singleton = PostOTPApi._internal();
  PostOTPApi._internal();
  static PostOTPApi get instance => _singleton;

  Future<Map<String, dynamic>> otpVerify({
    required num otp,
    required String email,
    required String action,
  }) async {
    try {
      // Map<String, dynamic> data = {
      //   "email": email,
      //   "password": password,
      //   "password_confirmation": password_confirmation,
      //   "username": username,
      // };
      Map<String, dynamic> data = ({
        "otp": otp,
        "email": email,
        "action": action,
      });

      Response response = await postHttp(Endpoints.otpVerify(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Verified Successfully");
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
