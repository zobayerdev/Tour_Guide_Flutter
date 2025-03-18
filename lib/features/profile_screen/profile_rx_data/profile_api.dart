import 'package:boylar_plate/features/profile_screen/model/profile_model.dart';
import 'package:boylar_plate/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetProfileApi {
  static final GetProfileApi _singleton = GetProfileApi._internal();
  GetProfileApi._internal();

  static GetProfileApi get instance => _singleton;

  Future<ProfileModel> getUserProfile() async {
    try {
      Response response = await getHttp(Endpoints.getProfileInfo());
      if (response.statusCode == 200) {
        final data = ProfileModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
