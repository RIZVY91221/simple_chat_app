import 'package:app_base_flutter/core/base/base_controller.dart';
import 'package:app_base_flutter/core/base/paging_controller.dart';
import 'package:app_base_flutter/model/chat_list.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class ChatListController extends BaseController{
  final BaseRepository repository;

  ChatListController({required this.repository});

  /* ***
   * Initialize Custom paging controller
   * **/
  late CustomPaginationController<ChatList> paginationController = CustomPaginationController<ChatList>(
      onFetchPage: (pageKey, filterText, searchText) async => await getChatListService(pageKey, searchText));

  @override
  void onInit() {
    paginationController.initialize();
    super.onInit();
  }

  Future<List<ChatList>> getChatListService(int pageKey, String? search) async {
    return await callDataService(repository.getChatList(Get.context!, pageKey));
  }
  @override
  void dispose() {
    paginationController.dispose();
    super.dispose();
  }
}