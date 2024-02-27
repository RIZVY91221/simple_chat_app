import 'package:app_base_flutter/core/uttils/extensions.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/input_field/app_input.dart';
import 'package:app_base_flutter/core/widget/global/input_field/wid_input_component.dart';
import 'package:flutter/material.dart';

///Base input text field usage....
Widget baseInputText() => const BaseTextInput(
      labelText: 'Sales Channel *',
      hintText: 'e.g. My Channel',
      readOnly: false,
    );

///Base borderless input text field usage....
Widget baseBorderlessInputText() => BaseBorderlessInputText(
      labelText: "Recipient Name",
      hints: "e.g John Doe",
      initialValue: "",
      focusNode: FocusNode(),
      dividerIndent: 10,
    );

///Base borderless input text field with error state usage....
Widget baseBorderlessInputTextWithErrorState() => BaseBorderlessInputText(
      labelText: "Order Number",
      hints: "Input (e.g 123)",
      initialValue: "",
      //prefixText: "", //Todo: set prefix text
      //errorText: "Order number should not match",//Todo: set error text
      //helpText: "Specify or system will auto-generate",//Todo: set helper text
      //isError: _listener(), //Todo: handle logic for error
      onChange: (v, c) {},
      focusNode: FocusNode(),
      onEdit: (title, value) {},
    );

///Base borderless long text input usage....
Widget baseLongInputText() => BaseBorderlessInputText(
      labelText: "Remarks",
      hints: "e.g Item should be pack carefully",
      initialValue: "",
      maxLength: 300, //Todo: set max text length
      focusNode: FocusNode(),
      onEdit: (title, value) {},
    );

///Base auto suggestion input usage....
Widget baseAutoSuggestionInputText() => BaseBorderlessInputText(
      labelText: "Shipping carrier",
      hints: "Select or input (e.g DHL)",
      initialValue: "",
      focusNode: FocusNode(),
      suggestionList: const ["DHL", "FEDEX", "Other"], //Todo: set auto suggestion item
      onEdit: (title, value) {},
    );

///Base drop down input usage....
Widget baseDropInputField() => BaseDropdownInputField(
      labelText: "Shipping carrier",
      hints: "Select or input (e.g DHL)",
      initialValue: "",
      focusNode: FocusNode(),
      dropDownItems: [DropdownModel(title: "test", valueOne: '1')], //Todo: set dropdown items using DropdownModel model
      pageReadOnly: false,
      onEdit: (title, value) {},
    );

///Base date time input usage....
Widget baseDateTimeInputField() => BaseDateInputField(
      labelText: "Fulfil By",
      initialValue: DateTime.now().toString().dateTimeFormat(format: 'dd MMM yy'), //Todo: set initial with same date format
      dateTimeFormat: 'dd MMM yy', //Todo: set specific date format
      secondaryValue: DateTime.now().toString(),
      disableDate: false, //todo: can disable date pass
      focusNode: FocusNode(),
      onEdit: (title, value) {},
    );

///Base date time input usage....
Widget baseUploadInputField() => BaseUploadInputField(
      labelText: "Attachment",
      focusNode: FocusNode(),
      helpText: "Accepts: jpg/png/pdf, 1MB per file",
      onTap: () {
        //Todo: handle upload logic here...
      },
    );

///Base radio input usage....
Widget baseRadioInputField() => BaseRadioInput(
      name: '', //Todo: set name
      value: '', //Todo set value variable
      // disableColor: AppColor.darkLightest6C7576, //Todo: set disable uncheck color
      onChangeItem: (v) {
        //Todo: handle logic...
      },
    );

///Base radio group input usage....
Widget baseRadioInputGroup() => BaseRadioGroupInput(
      typeList: const ["Spaceship", "Myself"], //Todo: set item list..
      isHorizontal: true, //Todo: set Alignment
      initialValue: 'Spaceship', //Todo: set initial selected value
      onChangeValue: (v) {
        //TODO: handle logic...
      },
    );

///Base checkbox input usage....
Widget baseCheckboxInputField() => BaseCheckboxInput(
      name: '', //Todo: set name
      value: '', //Todo set value variable
      // disableColor: AppColor.darkLightest6C7576, //Todo: set disable uncheck color
      onChangeItem: (v) {
        //Todo: handle logic...
      },
    );

///Base checkbox group input usage....
Widget baseCheckboxInputGroup() => BaseCheckboxGroupInput(
      typeList: const ["Spaceship", "Myself"], //Todo: set item list..
      isHorizontal: true, //Todo: set Alignment
      initialValue: 'Spaceship', //Todo: set initial selected value
      onChangeValue: (v) {
        //TODO: handle logic...
      },
    );

///Base checkbox group input usage....
Widget basePostalCodeInputFiled() => BasePostalCodeInputField(
      onEditPostalCode: (v) {},
      onEditAddress: (v) {},
      onEditUnit: (v) {},
    );

class InputFieldTestScreen extends StatelessWidget {
  const InputFieldTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Field",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).cardColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            baseInputText(),
            AppGap.vertical10,
            baseBorderlessInputText(),
            AppGap.vertical10,
            baseBorderlessInputTextWithErrorState(),
            AppGap.vertical10,
            baseLongInputText(),
            AppGap.vertical10,
            baseAutoSuggestionInputText(),
            AppGap.vertical10,
            baseDropInputField(),
            AppGap.vertical10,
            baseDateTimeInputField(),
            AppGap.vertical10,
            baseUploadInputField(),
            AppGap.vertical10,
            baseUploadInputField(),
            AppGap.vertical10,
            baseRadioInputField(),
            AppGap.vertical10,
            baseRadioInputGroup(),
            AppGap.vertical10,
            baseCheckboxInputField(),
            AppGap.vertical10,
            baseCheckboxInputGroup(),
            AppGap.vertical10,
            basePostalCodeInputFiled()
          ],
        ),
      ),
    );
  }
}
