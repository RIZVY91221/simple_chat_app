import 'package:app_base_flutter/features/auth/bindings/login_bindings.dart';
import 'package:app_base_flutter/features/auth/presentation/screen_login.dart';
import 'package:app_base_flutter/features/chat/chatList/bindings/chat_list_bindings.dart';
import 'package:app_base_flutter/features/chat/chatList/presentation/chat_list_screen.dart';
import 'package:app_base_flutter/features/chat/chat_activity/bindings/chat_bindings.dart';
import 'package:app_base_flutter/features/chat/chat_activity/presentation/chat_screen.dart';
import 'package:app_base_flutter/features/splash/binding/splash_binding.dart';
import 'package:app_base_flutter/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  //static variables
  static const String INITINAL = '/';
  static const String LOGIN_SCREEN = '/LOGIN_SCREEN';
  static const String CHAT_LIST = '/CHAT_LIST';
  static const String CHAT_SCREEN = '/CHAT_SCREEN';

  static final List<GetPage> routes = [
    GetPage(name: INITINAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: LOGIN_SCREEN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: CHAT_LIST, page: () => ChatListScreen(), binding: ChatListBindings()),
    GetPage(name: CHAT_SCREEN, page: () => ChatScreen(), binding: ChatBindings()),
  ];

  static generateRoute(RouteSettings settings) {
    return GetPageRoute(page: () => _generatePage(settings), binding: _generateBinding(settings));
  }

  static Widget _generatePage(RouteSettings settings) {
    switch (settings.name) {
      default:
        return Container();
    }
  }

  static Bindings? _generateBinding(RouteSettings settings) {
    switch (settings.name) {
      default:
        return null;
    }
  }
}
