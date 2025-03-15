// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:boylar_plate/features/auth_screen/forget_pass_screen/forgetpass_rx_data/forget_pass_api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class ForgetPassApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = PostForgetApi.instance;

  ForgetPassApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> forgetPassRx({
    required String email,
  }) async {
    try {
      Map<String, dynamic> data = await api.forgetPass(
        email: email,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
    ToastUtil.showShortToast("OTP send Successfully");
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
