import 'package:boylar_plate/features/home_screen/model/category_model/category_model.dart';
import 'package:boylar_plate/networks/dio/dio.dart';
import 'package:boylar_plate/networks/endpoints.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class CategoryAPI {
  static final CategoryAPI _singleton = CategoryAPI._internal();

  CategoryAPI._internal();

  static CategoryAPI get instance => _singleton;

  Future<CategoryModel> getCategory() async {
    try {
      Response response = await getHttp(Endpoints.getCategory());
      if (response.statusCode == 200) {
        final data = CategoryModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
