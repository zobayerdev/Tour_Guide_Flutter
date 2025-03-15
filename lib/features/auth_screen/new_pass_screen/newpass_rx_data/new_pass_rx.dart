// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:boylar_plate/features/auth_screen/new_pass_screen/newpass_rx_data/new_pass_api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class ResetPassApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = PostNewPassApi.instance;

  ResetPassApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> resetPassRX({
    required String email,
    required String otp,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      Map<String, dynamic> data = await api.resetPass(
        email: email,
        otp: otp,
        password: password,
        password_confirmation: password_confirmation,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
    ToastUtil.showShortToast("New password saved successfully");
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
