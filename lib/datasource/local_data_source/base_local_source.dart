import 'package:app_base_flutter/datasource/local_data_source/i_base_local_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseLocalDataSource {
  @factoryMethod
  factory BaseLocalDataSource.from() => ImplementBaseLocalDataSource();

  Future initBoxes(List<String> boxs);

  String get accessToken;
  String get currentLocale;
  Future<void> setCurrentLocale(String localeCode);
  Future<void> setAccessToken(String accessToken);
  Future<void> logout();
}
