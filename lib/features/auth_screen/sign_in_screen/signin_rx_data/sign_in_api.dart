import 'dart:convert';
import 'dart:developer';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/model/signin_response.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:boylar_plate/networks/dio/dio.dart';
import 'package:boylar_plate/networks/endpoints.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class SignInApi {
  static final SignInApi _singleton = SignInApi._internal();

  SignInApi._internal();

  static SignInApi get instance => _singleton;

  Future<SignInResponse> signInApi({
    required String email,
    required dynamic password,
  }) async {
    try {
      // Create the request data map
      Map data = {
        "email": email,
        "password": password,
      };
      // Make the POST request
      Response response = (await postHttp(Endpoints.login(), data));

      if (response.statusCode == 200) {
        SignInResponse data =
            SignInResponse.fromJson(json.decode(json.encode(response.data)));
        ToastUtil.showShortToast('Login Successfully');
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      log("Error during signin: $error");
      rethrow;
    }
  }
}
