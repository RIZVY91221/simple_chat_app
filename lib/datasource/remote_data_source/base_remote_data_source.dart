import 'package:app_base_flutter/core/network/dio_client.dart';
import 'package:app_base_flutter/core/network/rest_client.dart';
import 'package:app_base_flutter/datasource/remote_data_source/i_base_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRemoteDataSource {
  @factoryMethod
  static ImplementBaseRemoteDataSource create(DioClient dioClient, RestClient restClient) =>
      ImplementBaseRemoteDataSource(dioClient, restClient);

  Future<List<Map<String, dynamic>>> getAddress(String postalCode);
}
