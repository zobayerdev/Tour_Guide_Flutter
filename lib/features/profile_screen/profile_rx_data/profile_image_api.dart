import 'package:boylar_plate/features/profile_screen/model/profile_image_model.dart';
import 'package:boylar_plate/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetProfileImageApi {
  static final GetProfileImageApi _singleton = GetProfileImageApi._internal();
  GetProfileImageApi._internal();

  static GetProfileImageApi get instance => _singleton;

  Future<ProfileImageModel> getProfileImage() async {
    try {
      Response response = await getHttp(Endpoints.getProfileImage());
      if (response.statusCode == 200) {
        final data = ProfileImageModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
