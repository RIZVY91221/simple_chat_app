import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:app_base_flutter/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:app_base_flutter/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:app_base_flutter/model/chat_list.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRepository implements BaseRepository {
  // api objects
  final BaseRemoteDataSource _remoteDataSource;

  final BaseLocalDataSource _localDataSource;

  final BaseSharedPreference _sharedPreference;

  // constructor
  ImplementBaseRepository(this._remoteDataSource, this._localDataSource, this._sharedPreference);

  @override
  Future initBoxes(List<String> boxes) {
    return _localDataSource.initBoxes(boxes);
  }

  @override
  String get accessToken => _localDataSource.accessToken;

  @override
  Future<void> setAccessToken(String accessToken) {
    return _localDataSource.setAccessToken(accessToken);
  }

  @override
  Future<void> logout() {
    return _localDataSource.logout();
  }

  @override
  String get currentLocale => _localDataSource.currentLocale;

  @override
  Future<void> setCurrentLocale(String localeCode) async {
    return await _localDataSource.setCurrentLocale(localeCode);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddress(String postalCode) async {
    return await _remoteDataSource.getAddress(postalCode);
  }

  @override
  Future<QueryResult<Object?>> login(BuildContext context,String email) async{
    return await _remoteDataSource.login(context,email);
  }

  @override
  Future<QueryResult<Object?>> verifyOtp(BuildContext context, Map<String, dynamic> payload) async{
   return await _remoteDataSource.verifyOtp(context,payload);
  }

  @override
  Future<List<ChatList>> getChatList(BuildContext context, int page) async{
   return await _remoteDataSource.getChatList(context, page);
  }

}
