
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PreferenceModule {


  // DI Providers:--------------------------------------------------------------
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();


}
