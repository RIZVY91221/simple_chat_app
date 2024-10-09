import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:app_base_flutter/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:app_base_flutter/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:app_base_flutter/model/chat_list.dart';
import 'package:app_base_flutter/repository/i_base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRepository {
  @factoryMethod
  static ImplementBaseRepository create(
    BaseRemoteDataSource remoteDataSource,
    BaseLocalDataSource localDataSource,
    BaseSharedPreference sharedPreference,
  ) =>
      ImplementBaseRepository(
        remoteDataSource,
        localDataSource,
        sharedPreference,
      );
  //local_base
  Future initBoxes(List<String> boxs);
  String get currentLocale;
  Future<void> setCurrentLocale(String localeCode);
  String get accessToken;
  Future<void> setAccessToken(String accessToken);
  Future<void> logout();
  Future<List<Map<String, dynamic>>> getAddress(String postalCode);

  Future<QueryResult> login(BuildContext context,String email);
  Future<QueryResult> verifyOtp(BuildContext context, Map<String, dynamic> payload);
  Future<List<ChatList>> getChatList(BuildContext context, int page);
}
