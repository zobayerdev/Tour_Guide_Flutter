import 'dart:developer';
import 'package:boylar_plate/constants/app_constants.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/model/signin_response.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/signin_rx_data/sign_in_api.dart';
import 'package:boylar_plate/helpers/di.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:boylar_plate/networks/dio/dio.dart';
import 'package:boylar_plate/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/streams.dart';

final class SignInApiRx extends RxResponseInt<SignInResponse> {
  final api = SignInApi.instance;

  SignInApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signIn({
    required String email,
    required dynamic password,
  }) async {
    try {
      // Call the sign-in API
      SignInResponse data =
          await api.signInApi(email: email, password: password);
      await handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      // Handle error
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(SignInResponse data) {
    // Extract the token from the response
    String token = data.data!.token!.original!.accessToken!;

    // Save the token and login status using appData
    appData.write(kKeyAccessToken, token); // Storing the token
    appData.write(kKeyIsLoggedIn, true); // Setting the logged-in status

    // Update DioSingleton with the new token
    DioSingleton.instance.update(token);
    // NavigationService.navigateTo(Routes.navigationUser);

    // Add the data to the stream
    dataFetcher.sink.add(data);

    return true;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    // Handle API error using DioException
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        // Show error message from the response
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        // Show general message for other status codes
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    // Log the error and add it to the stream
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
