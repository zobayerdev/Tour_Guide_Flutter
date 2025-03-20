// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/edit_profile/edit_profile_image_api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class PostUpdateProfileImageRx
    extends RxResponseInt<Map<String, dynamic>> {
  final api = PostProfileImageApi.instance;

  PostUpdateProfileImageRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> updateImageRx({
    File? avatar,
  }) async {
    try {
      Map<String, dynamic> data = await api.updateImageApi(
        avatar: avatar,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
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
