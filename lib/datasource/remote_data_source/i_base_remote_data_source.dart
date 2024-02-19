import 'package:app_base_flutter/core/network/dio_client.dart';
import 'package:app_base_flutter/core/network/rest_client.dart';
import 'package:app_base_flutter/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRemoteDataSource extends BaseRemoteDataSource {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ImplementBaseRemoteDataSource(this._dioClient, this._restClient);
}
