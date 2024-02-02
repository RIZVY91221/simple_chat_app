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

  @override
  Future<List<Map<String, dynamic>>> getAddress(String postalCode) async {
    try {
      //Todo: api call....uncomment this line
      //Map<String, dynamic> query = {"postal": postalCode};
      //final res = await _dioClient.get(Endpoints.PostalCode,queryParameters: query);
      //Todo:Remove test data when api call....
      List<Map<String, dynamic>> tempData = [
        {
          "block": "6",
          "street": "SCOTTS ROAD",
          "street_display": "6 SCOTTS ROAD, DBS NTUC SCOTTS SQUARE",
          "building": "DBS NTUC SCOTTS SQUARE",
          "postal": "228209"
        },
        {
          "block": "6",
          "street": "SCOTTS ROAD",
          "street_display": "6 SCOTTS ROAD, OCBC SCOTTS SQUARE",
          "building": "OCBC SCOTTS SQUARE",
          "postal": "228209"
        },
        {"block": "147", "street": "TAMPINES AVENUE 5", "street_display": "147 TAMPINES AVENUE 5", "building": "", "postal": "521147"}
      ];
      return await tempData.where((e) => e['postal'] == postalCode).toList();
    } catch (e) {
      rethrow;
    }
  }
}
