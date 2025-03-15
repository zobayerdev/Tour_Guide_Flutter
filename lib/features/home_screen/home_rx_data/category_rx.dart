import 'dart:developer';
import 'package:boylar_plate/features/home_screen/home_rx_data/category_api.dart';
import 'package:boylar_plate/features/home_screen/model/category_model/category_model.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class GetCategoryAPIRX extends RxResponseInt<CategoryModel> {
  final api = CategoryAPI.instance;

  GetCategoryAPIRX({required super.empty, required super.dataFetcher});

  ValueStream get getCategory => dataFetcher.stream;

  Future<CategoryModel?> getCategoryRX() async {
    try {
      CategoryModel data = await api.getCategory();
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
