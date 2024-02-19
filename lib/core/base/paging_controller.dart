import 'package:app_base_flutter/core/values/values.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomPaginationController<T> {
  final PagingController<int, T> _pagingController;
  final Future<List<T>> Function(int pageKey, String? filter, String? search) onFetchPage;

  CustomPaginationController({required this.onFetchPage})
      : _pagingController = PagingController<int, T>(firstPageKey: AppValues.defaultPageNumber);

  PagingController<int, T> get pagingController => _pagingController;

  RxString currentFilter = ''.obs;
  RxString currentSearch = ''.obs;

  void initialize() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, currentFilter.value, currentSearch.value);
    });
  }

  Future<void> _fetchPage(int pageKey, String? filter, String? search) async {
    try {
      final items = await onFetchPage(pageKey, filter, search);
      if (items.isEmpty) {
        _pagingController.appendLastPage([]);
      } else {
        final isLastPage = items.length < AppValues.defaultPageSize;

        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(items, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void refresh({String? filter, String? search}) {
    currentFilter.value = filter ?? '';
    currentSearch.value = search ?? '';
    _pagingController.refresh();
  }

  void dispose() {
    _pagingController.dispose();
  }
}
