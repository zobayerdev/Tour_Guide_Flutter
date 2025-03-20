import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostProfileUpdateApi {
  static final PostProfileUpdateApi _singleton =
      PostProfileUpdateApi._internal();
  PostProfileUpdateApi._internal();
  static PostProfileUpdateApi get instance => _singleton;

  Future<Map<String, dynamic>> updateProfileApi({
    String? name,
    String? gender,
    String? phone,
    String? bio,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "name": name,
        "gender": gender,
        "phone": phone,
        "bio": bio,
      });

      Response response = await postHttp(Endpoints.updateProfile(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Info Update Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
