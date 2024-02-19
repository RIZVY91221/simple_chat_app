import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoadingSkeleton extends StatelessWidget {
  const WidgetLoadingSkeleton({
    Key? key,
    required this.pageState,
    required this.rows,
    this.scroll = true,
    this.backgroundColor,
    this.shimmerColor,
    this.skeletonColor,
  }) : super(key: key);

  final PageState pageState;
  final int rows;
  final bool scroll;
  final Color? backgroundColor;
  final Color? shimmerColor;
  final Color? skeletonColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: pageState == PageState.LOADING ? 1 : 0,
      duration: AppDuration.milliseconds300,
      child: Container(
        color: backgroundColor,
        child: Shimmer.fromColors(
          baseColor: skeletonColor ?? Colors.grey.withOpacity(0.15),
          highlightColor: shimmerColor ?? Colors.grey.withOpacity(0.3),
          child: ListView.builder(
            shrinkWrap: true,
            physics: scroll ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
            itemCount: rows,
            itemBuilder: (_, i) => const Skeleton(),
          ),
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appSVG(Assets.svgShimerOne, width: double.infinity, height: 130);
  }
}
