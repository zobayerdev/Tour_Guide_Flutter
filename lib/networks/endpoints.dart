// ignore_for_file: constant_identifier_names

const String url = "https://tourguide.zobayerdev.top";
const String imageUrls = "$url/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();

  //post API
  static String signUp() => "/api/register";
  static String login() => "/api/login";
  static String resendOTP() => "/api/resend-otp";
  static String otpVerify() => "/api/verify-otp-password";
  static String forgetPass() => "/api/forget-password";
  static String resetPass() => "/api/reset-password";
  static String logout() => "/api/logout";

  // Get API
  static String getProfileInfo() => "/api/me";
  static String getProfileImage() => "/api/show-image";
  static String getCategory() => "/api/category-show";
}
