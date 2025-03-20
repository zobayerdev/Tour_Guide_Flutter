import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PostProfileImageApi {
  static final PostProfileImageApi _singleton = PostProfileImageApi._internal();
  PostProfileImageApi._internal();
  static PostProfileImageApi get instance => _singleton;

  Future<Map<String, dynamic>> updateImageApi({
    File? avatar,
  }) async {
    try {
      if (avatar == null || !avatar.existsSync()) {
        throw Exception("No image file selected");
      }

      // Create a MultipartFile from the selected image
      MultipartFile file = await MultipartFile.fromFile(avatar.path);

      // Add the file to FormData
      FormData data = FormData.fromMap({
        "avatar": file,
      });

      // Send the request to update the image
      Response response = await postHttp(Endpoints.updateImage(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Info Update Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      print("Error: $error");
      rethrow;
    }
  }
}
