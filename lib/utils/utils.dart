

import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class Utils{

  static bool isColorDark(Color color) {
    return ((0.299 * color.r) + (0.587 * color.g) + (0.114 * color.b) < 0.7);
  }

  static launchURL(String url) async {
    final Uri toLaunch =
    Uri.parse(url);
    if (!await launchUrl(
      toLaunch,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

}