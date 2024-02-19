import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:app_base_flutter/core/network/exceptions/bad_request_exceptions.dart';
import 'package:app_base_flutter/service/bg_service/background_service.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> syncData() async {
  final response = await http.get(Uri.parse('https://www.spaceship.com.sg/api/item_dimensions?0=f&1=u&2=l&3=l'),
      headers: {"Accept": "application/json", "source": "fulfilment_mobile_app"}).timeout(
    const Duration(minutes: 5),
    onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response('Error', 408); // Request Timeout response status code
    },
  );
  return response;
}

//onstart method
@pragma("vm:entry-point")
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  service.invoke("update", {"current_date": DateTime.now().toIso8601String(), "response": "", "isRunning": true});
  service.on("setAsForeground").listen((event) {
    debugPrint("foreground ===============");
  });

  service.on("setAsBackground").listen((event) {
    debugPrint("background ===============");
  });

  service.on("stopService").listen((event) {
    service.invoke("update", {"current_date": DateTime.now().toIso8601String(), "response": "", "isRunning": false, "status": "STOP"});
    service.stopSelf();
  });
  await syncData().then((value) async {
    if (value.statusCode < 200 || value.statusCode > 400) {
      service.invoke(
          "update", {"current_date": DateTime.now().toIso8601String(), "response": "", "isRunning": false, "status": "BAD_REQUEST"});
      service.stopSelf();
      throw BadRequestException(message: "Error fetching data from server", statusCode: value.statusCode);
    } else {
      Future.delayed(const Duration(seconds: 20), () {
        log(value.statusCode.toString());
        log(json.decode(value.body)["message"] ?? "");
        service.invoke("update", {
          "current_date": DateTime.now().toIso8601String(),
          "response": json.decode(value.body),
          "isRunning": false,
          "status": "SUCCESS"
        });
        service.stopSelf();
      });
    }
  }).onError((error, stackTrace) {
    service.stopSelf();
    service.invoke("update", {"current_date": DateTime.now().toIso8601String(), "response": "", "isRunning": false, "status": "TIMEOUT"});
  });

  debugPrint("Background service ${DateTime.now()}");
}

//iosbackground
@pragma("vm:entry-point")
Future<bool> iosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

class ImplementBackgroundService implements BackgroundServiceHandler {
  var service = FlutterBackgroundService();

  @override
  Future<void> initializeBackgroundService() async {
    await service.configure(
        iosConfiguration: IosConfiguration(onBackground: iosBackground, onForeground: onStart),
        androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: false,
          isForegroundMode: true,
        ));
    //service.startService();
  }

  @override
  Future<void> startService() async => await service.startService();

  @override
  Future<void> stopService() async => service.invoke("stopService");

  @override
  Future getService() async => service;

  @override
  Stream<bool> isRunning() => service.isRunning().asStream();

  @override
  void setLastData(List items) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> itemsList = items.map((e) => e["name"].toString()).toList();
    preferences.setStringList("lastSyncList", itemsList);
  }

  @override
  Future<List<String>> getLastSyncItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList("lastSyncList") ?? [];
  }
}
