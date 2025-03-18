import 'dart:developer';
import 'package:boylar_plate/features/profile_screen/model/profile_model.dart';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/profile_api.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class GetProfileApiRx extends RxResponseInt<ProfileModel> {
  final api = GetProfileApi.instance;

  GetProfileApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getAvailableItemsStream => dataFetcher.stream;

  Future<ProfileModel?> getUserProfileInformation() async {
    try {
      ProfileModel data = await api.getUserProfile();
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
