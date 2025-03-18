import 'dart:developer';
import 'package:boylar_plate/features/profile_screen/model/profile_image_model.dart';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/profile_image_api.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class GetProfileImageApiRx extends RxResponseInt<ProfileImageModel> {
  final api = GetProfileImageApi.instance;

  GetProfileImageApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getAvailableItemsStream => dataFetcher.stream;

  Future<ProfileImageModel?> getImageRx() async {
    try {
      ProfileImageModel data = await api.getProfileImage();
      log("$data");
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return null;
  }
}
