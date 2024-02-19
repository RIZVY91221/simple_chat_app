import 'package:app_base_flutter/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ImplementBaseSharedPreference implements BaseSharedPreference {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  ImplementBaseSharedPreference(this._sharedPreference);
}
