import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/divider/wid_divider.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({Key? key, this.onPressCard, this.children}) : super(key: key);
  final VoidCallback? onPressCard;
  final List<Widget>? children;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCard,
      child: Card(
        elevation: 0.0,
        color: Theme.of(context).cardColor,
        child: AnimatedContainer(
          duration: AppDuration.milliseconds300,
          curve: Curves.easeOut,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: children ?? [],
          ),
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final Widget? child;
  const CardHeader({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: child,
    );
  }
}

class CardBody extends StatelessWidget {
  final Widget child;

  const CardBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p10),
      child: child,
    );
  }
}

class CardFooter extends StatelessWidget {
  final MainAxisAlignment alignment;
  final List<Widget> children;

  const CardFooter({Key? key, this.alignment = MainAxisAlignment.end, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p10, top: AppPadding.p4),
      child: Row(
          mainAxisSize: MainAxisSize.max, mainAxisAlignment: alignment, crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }
}

class CardWrapperWidget extends StatelessWidget {
  final VoidCallback? onPressCard;
  final CardHeader? cardHeader;
  final CardBody? cardBody;
  final CardFooter? cardFooter;

  const CardWrapperWidget({Key? key, this.onPressCard, this.cardHeader, this.cardBody, this.cardFooter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseCard(
          onPressCard: onPressCard,
          children: [
            cardHeader ?? const SizedBox.shrink(),
            cardBody ?? const SizedBox.shrink(),
            cardFooter != null
                ? const AppDivider(
                    thickness: 0.4,
                  )
                : const SizedBox.shrink(),
            cardFooter ?? const SizedBox.shrink()
          ],
        ),
      ],
    );
  }
}
