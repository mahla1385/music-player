import 'package:permission_handler/permission_handler.dart';

class Permissions {

  static Future<bool> requestAudioPermission() async {
    if (await Permission.audio.isGranted) return true;

    if (await Permission.audio.request().isGranted) return true;

    if (await Permission.storage.isGranted) return true;

    if (await Permission.storage.request().isGranted) return true;

    return false;
  }


}