import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:flutter/material.dart';

//Default primary Button Usage>>>>>
Widget defaultPrimary() => DefaultPrimaryButton(text: "DefaultButton", onPressed: () {});
//Default Secondary Button Usage>>>>>
Widget defaultSecondary() => DefaultSecondaryButton(text: "SecondaryButton", onPressed: () {});
//Standard primary Button Usage>>>>>
Widget standardPrimary() => StandardPrimaryButton(text: "StandardP", onPressed: () {});
//Standard secondary Button Usage>>>>>
Widget standardSecondary() => StandardSecondaryButton(text: "StandardS", onPressed: () {});
//Standard secondary with spinner Button Usage>>>>>
Widget standardSecondaryWithSpinner() => StandardSecondaryButton(text: "Spinner", onPressed: () {}, enableSpinner: true);
//Text Button Usage>>>>>
Widget textButton() => TextPrimaryButton(text: "Text Button", onPressed: () {});

class ButtonTestScreen extends StatelessWidget {
  const ButtonTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).cardColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            defaultPrimary(),
            AppGap.vertical10,
            defaultSecondary(),
            AppGap.vertical10,
            standardPrimary(),
            AppGap.vertical10,
            standardSecondary(),
            AppGap.vertical10,
            standardSecondaryWithSpinner(),
            AppGap.vertical10,
            textButton()
          ],
        ),
      ),
    );
  }
}
