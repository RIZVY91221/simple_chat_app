import 'package:app_base_flutter/datasource/shared_preference_data_source/i_base_shared_prefrence.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
abstract class BaseSharedPreference {
  @factoryMethod
  static ImplementBaseSharedPreference create(SharedPreferences preferences) => ImplementBaseSharedPreference(preferences);
}
