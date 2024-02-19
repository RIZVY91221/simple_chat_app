import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/core/widget/global/loading/wid_loading_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagingView<T> extends StatelessWidget {
  const PagingView({super.key, required this.pagingController, required this.itemBuilder, this.onRefresh});
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Future<void>? onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          onRefresh ??
          Future.sync(
            () => pagingController.refresh(),
          ),
      child: PagedListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, int int) => const Divider(
                height: 0.0,
                thickness: 0.5,
              ),
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<T>(
            firstPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
              pageState: PageState.LOADING,
              rows: 4,
            ),
            newPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
              pageState: PageState.LOADING,
              rows: 4,
            ),
            noItemsFoundIndicatorBuilder: (context) => AppIcon.noData(top: MediaQuery.of(context).size.height / 3),
            itemBuilder: (context, item, index) => itemBuilder(context, item, index),
          )),
    );
  }
}
