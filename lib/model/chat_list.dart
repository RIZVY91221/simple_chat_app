import 'dart:developer';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatList {
  String? id;
  User? sender;
  String? lastMessage;
  String? participantId;
  String? conversationId;
  List<types.Message>? message;
  ChatList({
    this.id,
    this.sender,
    this.lastMessage,
    this.participantId,
    this.conversationId,
    this.message
  });

  factory ChatList.fromJson(Map<String, dynamic> json) {
    return ChatList(
      id: json['id'] as String?,
      sender: json['sender'] != null ? User.fromJson(json['sender']) : null,
      lastMessage: json['lastMessage'] as String?,
      participantId: json['participantId'] as String?,
      conversationId: json['conversationId'] as String?,
       message: (json['message'] as List<dynamic>?)
        ?.map((msg) => types.Message.fromJson(msg))
        .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender?.toJson(),
      'lastMessage': lastMessage,
      'participantId': participantId,
      'conversationId': conversationId,
      'message': message?.map((msg) => msg.toJson()).toList()
    };
  }

   static List<types.Message> handleDynamicList(List<dynamic> data){
    log(data.toString());
    return data.map((e) {
      Map<String,dynamic> temp={
        "author": {
          "firstName": e["node"]["sender"]["user"]["firstName"],
          "id": e["node"]["sender"]["user"]["id"],
          "lastName": e["node"]["sender"]["user"]["lastName"],
        },
        "createdAt": 1655648401000,
        "id": "64747b28-df19-4a0c-8c47-316dc3546e3c",
        "status": "seen",
        "text": e["node"]["content"],
        "type": types.MessageType.text.name
      };
      return types.Message.fromJson(temp);
    }).toList();
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? username;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImage,
    this.username
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      profileImage: json['profilePhoto'] as String?, // Adjust the key if necessary
      username: json['username'] as String?, // Adjust the key if necessary
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'profilePhoto': profileImage,
      'username':username// Adjust the key if necessary
    };
  }


}
//      var user=types.User(id: e["node"]["sender"]["user"]["id"],firstName:e["node"]["sender"]["user"]["firstName"] );
