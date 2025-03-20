// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/edit_profile/edit_profile_api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../helpers/di.dart';
import '../../../../../helpers/toast.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/rx_base.dart';

final class PostUpdateProfileRx extends RxResponseInt<Map<String, dynamic>> {
  final api = PostProfileUpdateApi.instance;

  PostUpdateProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> updateProfileRx({
    String? name,
    String? gender,
    String? phone,
    String? bio,
  }) async {
    try {
      Map<String, dynamic> data = await api.updateProfileApi(
        name: name,
        gender: gender,
        phone: phone,
        bio: bio,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
    // Extract the token from the response
    String token = data['data']['token'];

    // Save the token and login status using appData
    appData.write(kKeyAccessToken, token); // Storing the token
    appData.write(kKeyIsLoggedIn, true); // Setting the logged-in status

    // Update DioSingleton with the new token
    DioSingleton.instance.update(token);

    // Add the data to the stream
    dataFetcher.sink.add(data);

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
