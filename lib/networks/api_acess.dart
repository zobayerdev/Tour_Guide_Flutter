// GetLoginRX getLoginRXObj = GetLoginRX(
//     empty: LoginResponse(), dataFetcher: BehaviorSubject<LoginResponse>());

// GetSignUpRX getSignUpRXObj =
//     GetSignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

import 'package:boylar_plate/features/auth_screen/otp_screen/otp_rx_data/otp_rx.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/model/signin_response.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/signin_rx_data/sign_in_rx.dart';
import 'package:boylar_plate/features/auth_screen/sign_up_screen/signup_rx_data/sign_up_rx.dart';
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
