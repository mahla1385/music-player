import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class DataBaseSerial{
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();


  Future<SharedPreferences> _initSerial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("serialDevice") == false ){
      prefs.setString("serialDevice", getRandomString(30));
    }
    if(prefs.containsKey("update_pwa") == false ){
      prefs.setString("update_pwa", "1");
    }
    return prefs;
  }


  Future<String> getSerial() async {
    final dataBase = await _initSerial();
    return dataBase.getString("serialDevice")!;
  }
  Future<String> getVersion() async {
    final dataBase = await _initSerial();
    return dataBase.getString("update_pwa")!;
  }
  Future<void> setVersionApp(String version) async {
    final dataBase = await _initSerial();
     dataBase.setString("update_pwa",version);
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}