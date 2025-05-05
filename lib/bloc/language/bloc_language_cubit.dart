import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:music/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const locale_db = "local_db_1";
class BlocLanguageCubit extends Cubit<Locale> {
  BlocLanguageCubit() : super(Locale('en')){
    _getLang.call();
  }

  Future<void> _getLang() async {
    final db  = await _initialDb();
    final language = AppLocalizations.supportedLocales.where((element) => element.languageCode == db.getString(locale_db),).first;
    emit(language);
  }

  setChangeLanguage(String lang) async {
    final db  = await _initialDb();
    db.setString(locale_db,lang);
    final language = AppLocalizations.supportedLocales.where((element) => element.languageCode == lang,).first;
    emit(language);
  }


  static Future<SharedPreferences> _initialDb() async {
    final db = await SharedPreferences.getInstance();
    if (!db.containsKey(locale_db))
      db.setString(locale_db,"en");
    return db;
  }

}
