// GetLoginRX getLoginRXObj = GetLoginRX(
//     empty: LoginResponse(), dataFetcher: BehaviorSubject<LoginResponse>());

// GetSignUpRX getSignUpRXObj =
//     GetSignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

import 'package:boylar_plate/features/auth_screen/sign_up_screen/signup_rx_data/sign_up_rx.dart';
import 'package:rxdart/rxdart.dart';

SignUpApiRx postSignUpRX = SignUpApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(), // Specify the type here
);
