import 'dart:developer';

import 'package:app_base_flutter/core/network/dio_client.dart';
import 'package:app_base_flutter/core/network/rest_client.dart';
import 'package:app_base_flutter/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:app_base_flutter/datasource/remote_data_source/query/graphql_query.dart';
import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/model/chat_list.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
      List<Map<String, dynamic>> tempData = [
        {
          "block": "6",
          "street": "SCOTTS ROAD",
          "street_display": "6 SCOTTS ROAD, DBS NTUC SCOTTS SQUARE",
          "building": "DBS NTUC SCOTTS SQUARE",
          "postal": "228209"
        },
      ];
      return await tempData.where((e) => e['postal'] == postalCode).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<QueryResult<Object?>> login(BuildContext context, String email) async{
    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;
      final MutationOptions options = MutationOptions(
        document: gql(loginMutation),
        variables: {
          'input': {
            'email': email,
          },
        },
      );
      final QueryResult result = await client.mutate(options);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<QueryResult<Object?>> verifyOtp(BuildContext context, Map<String, dynamic> payload) async{
    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;
      final MutationOptions options = MutationOptions(
        document: gql(verifyOtpMutation),
        variables: payload
      );
      final QueryResult result = await client.mutate(options);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ChatList>> getChatList(BuildContext context, int page) async{
    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;
      final QueryOptions options = QueryOptions(
          document: gql(getConversationParticipantsQuery),
          variables: const {
            'first': 10,
          }
      );
      final QueryResult result=await client.query(options);
      log(result.data.toString());
      List<dynamic>data=result.data?['conversationParticipantsConnection']["edges"] as List<dynamic>;
     // List<dynamic> messages=result.data?["node"]["conversation"]["messagesConnection"]["edges"] as List<dynamic>;
      return List<ChatList>.from(data.map((e) {
        log("jsnddjadjnandad");
        List<dynamic> messages=e["node"]["conversation"]["messagesConnection"]["edges"] as List<dynamic>;
        log(messages.toString());
        log("jsnddjadjnandad");
        return ChatList(
        id: e["node"]["id"],
        sender:User.fromJson(e["node"]["participant"]["user"] as Map<String,dynamic>),
        lastMessage: e["node"]["conversation"]["lastInitiatorMessage"]!=null?e["node"]["conversation"]["lastInitiatorMessage"]["content"]:null,
        participantId: e["node"]["participantId"],
        conversationId: e["node"]["conversationId"],
        message:ChatList.handleDynamicList(messages)
      );
      }).toList());
    } catch (e) {
      rethrow;
    }
  }

}


