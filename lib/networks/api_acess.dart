import 'package:boylar_plate/features/auth_screen/forget_pass_screen/forgetpass_rx_data/forget_pass_rx.dart';
import 'package:boylar_plate/features/auth_screen/new_pass_screen/newpass_rx_data/new_pass_rx.dart';
import 'package:boylar_plate/features/auth_screen/otp_screen/otp_rx_data/otp_rx.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/model/signin_response.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/signin_rx_data/sign_in_rx.dart';
import 'package:boylar_plate/features/auth_screen/sign_up_screen/signup_rx_data/sign_up_rx.dart';
import 'package:boylar_plate/features/home_screen/home_rx_data/category_rx.dart';
import 'package:boylar_plate/features/home_screen/model/category_model/category_model.dart';
import 'package:boylar_plate/features/profile_screen/model/profile_image_model.dart';
import 'package:boylar_plate/features/profile_screen/model/profile_model.dart';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/logout_rx.dart';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/profile_image_rx.dart';
import 'package:boylar_plate/features/profile_screen/profile_rx_data/profile_rx.dart';
import 'package:rxdart/rxdart.dart';

SignUpApiRx postSignUpRX = SignUpApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(), // Specify the type here
);

PostOTPRx postOTPRx = PostOTPRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(), // Specify the type here
);

SignInApiRx postLoginRx = SignInApiRx(
  empty: SignInResponse(),
  dataFetcher: BehaviorSubject<SignInResponse>(), // Specify the type here
);

ForgetPassApiRx forgetPassApiRx = ForgetPassApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(), // Specify the type here
);

ResetPassApiRx resetPassApiRx = ResetPassApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(), // Specify the type here
);

GetCategoryAPIRX getCategoryAPIRX = GetCategoryAPIRX(
  empty: CategoryModel(),
  dataFetcher: BehaviorSubject<CategoryModel>(), // Specify the type here
);

GetProfileApiRx getProfileApiRx = GetProfileApiRx(
  empty: ProfileModel(),
  dataFetcher: BehaviorSubject<ProfileModel>(), // Specify the type here
);

GetProfileImageApiRx getProfileImageApiRx = GetProfileImageApiRx(
  empty: ProfileImageModel(),
  dataFetcher: BehaviorSubject<ProfileImageModel>(), // Specify the type here
);

/*Logout user*/
PostLogOutRX postLogOutRX = PostLogOutRX(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);
