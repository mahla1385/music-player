



import 'package:shared_preferences/shared_preferences.dart';

const String keyPermission = 'permission';
class DbSetting {


  static Future<SharedPreferences> initDB() async {
    return await SharedPreferences.getInstance();
  }


  static Future<void> setSettingBool(String event,{bool value = false}) async {
    final prefs =await initDB();
    await prefs.setBool(event, value);
  }

  static Future<bool> getSettingBool(String event) async {
    final prefs =await initDB();
    if(prefs.containsKey(event)){
      return  await prefs.getBool(event)!;
    }else{
      return false;
    }
  }



}