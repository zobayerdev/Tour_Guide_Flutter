import 'dart:developer';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/logout_api.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class PostLogOutRX extends RxResponseInt {
  final api = LogOutApi.instance;

  String message = "Something went wrong";

  PostLogOutRX({required super.empty, required super.dataFetcher});

  ValueStream get getLogoutData => dataFetcher.stream;

  Future<bool> logOut() async {
    try {
      Map resdata = await api.logOut();
      return handleSuccessWithReturn(resdata);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) {
    dataFetcher.sink.add(data);

    // message = data["message"];
    // if (data["success"] == false) throw Exception();
    log(">>>>>>>>>>>>>>>>>>> Logout success");
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String errorMessage = 'Something went wrong';
    log(error.toString());

    errorMessage = error.response?.data["message"] ?? "Something went wrong";
    return super.handleErrorWithReturn(errorMessage);
  }
}
