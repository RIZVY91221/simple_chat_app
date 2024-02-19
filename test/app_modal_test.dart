//Alert modal usage.....
//Todo: set in on like this {onPress()=> AlertModal.show()};
//Confirmation Modal usage.....
//Todo: set in on like this {onPress()=> ConfirmationModal.show()};
//Dialog Modal usage.....
//Todo:set in on like this {onPress()=> DialogModal.show()};
//Full Modal usage.....
//Todo: set in on like this {onPress()=> FullModal.show()};

import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:app_base_flutter/core/widget/global/modal/app_modal.dart';
import 'package:flutter/material.dart';

class ModalTestScreen extends StatelessWidget {
  const ModalTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Modal",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).cardColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            StandardSecondaryButton(
              text: "Alert Modal",
              onPressed: () => AlertModal.show(),
            ),
            AppGap.vertical10,
            StandardSecondaryButton(
              text: "Confirmation Modal",
              onPressed: () => ConfirmationModal.show(),
            ),
            AppGap.vertical10,
            StandardSecondaryButton(
              text: "Dialog Modal",
              onPressed: () => DialogModal.show(),
            ),
            AppGap.vertical10,
            StandardSecondaryButton(
              text: "Full Modal",
              onPressed: () => FullModal.show(),
            ),
          ],
        ),
      ),
    );
  }
}
