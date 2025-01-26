// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

urlLunch(String url) {
  if (Platform.isIOS) {
    launch(url, forceSafariVC: false);
  } else {
    launch(url, forceWebView: false);
  }
}
