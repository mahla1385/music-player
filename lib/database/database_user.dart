


import 'dart:convert';

import 'package:music/api/user/data_profile.dart';
import 'package:music/api/user/data_user_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';



const  String dbUser = "database_user_p";
const  String dbUserSetting = "database_user_setting";
class DBUser{

  static Future<SharedPreferences> _initialDb() async {
    final db = await SharedPreferences.getInstance();
    if (!db.containsKey(dbUser))
      db.setString(dbUser, jsonEncode(DataProfile.fromJson({})));
    return db;
  }


  static Future<bool> isCheckLogin() async {
    final currentData = await getDataProfile();
    return (currentData.uid != null && currentData.uid != null);
  }


  static Future<bool> logoutAccount() async {
    final db = await _initialDb();
    return db.remove(dbUser);
  }

  static Future<DataProfile> getDataProfile() async {
    final db = await _initialDb();
    final jsonString = db.getString(dbUser);
    if (jsonString == null) {
      throw Exception('No data found for dbUser');
    }
    return DataProfile.fromJson(jsonDecode(jsonString));
  }

  static Future<DataUserSetting> getDataProfileSetting() async {
    final db = await _initialDb();
    final jsonString = db.getString(dbUserSetting);
    if (jsonString == null) {
      return DataUserSetting();
    }
    return DataUserSetting.fromJson(jsonDecode(jsonString));
  }

  static Future<bool> setDataProfile(DataProfile newData) async {
    final db = await _initialDb();
    final currentData = await getDataProfile();
    final mergedData = currentData.toJson()
      ..addAll(newData.toJson()..removeWhere((key, value) => value == null));
    return db.setString(dbUser, jsonEncode(mergedData));
  }

  static Future<bool> setDataProfileSetting(DataUserSetting data) async {
    final db = await _initialDb();
    final currentData = await getDataProfileSetting();
    final mergedData = currentData.toJson()
      ..addAll(data.toJson()..removeWhere((key, value) => value == null));
    return db.setString(dbUserSetting, jsonEncode(mergedData));
  }



}