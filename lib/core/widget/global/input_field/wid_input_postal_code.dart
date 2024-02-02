import 'package:app_base_flutter/core/uttils/toasts.dart';
import 'package:app_base_flutter/core/widget/global/input_field/app_input.dart';
import 'package:app_base_flutter/core/widget/global/input_field/wid_input_component.dart';
import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetPostalCodeInput extends StatefulWidget {
  const WidgetPostalCodeInput({Key? key, this.innerPadding, this.onEditPostalCode, this.onEditAddress, this.onEditFlor}) : super(key: key);
  final EdgeInsets? innerPadding;
  final Function(String)? onEditPostalCode;
  final Function(String)? onEditAddress;
  final Function(String)? onEditFlor;

  @override
  State<WidgetPostalCodeInput> createState() => _WidgetPostalCodeInputState();
}

class _WidgetPostalCodeInputState extends State<WidgetPostalCodeInput> {
  var addressList = List<Address>.empty(growable: true).obs;
  var postCode = ''.obs;
  var code = ''.obs;
  final _postalFocusNode = FocusNode().obs;
  final _addressFocusNode = FocusNode().obs;
  final _unitFocusNode = FocusNode().obs;

  void handleAddress() async {
    getIt<BaseRepository>().getAddress(postCode.value).then((value) {
      if (value.isNotEmpty) {
        for (int i = 0; i < value.length; i++) {
          addressList.add(Address.fromJson(value[i]));
          debugPrint(addressList.length.toString());
        }
      }
    });
  }

  void setPostalCode(String code) {
    postCode.value = code;
    widget.onEditPostalCode?.call(code);
    if (postCode.value.length == 6) {
      handleAddress();
    }
    _postalFocusNode.refresh();
    _addressFocusNode.refresh();
  }

  @override
  Widget build(BuildContext context) {
    String pCode = '';
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BaseBorderlessInputText(
            labelText: "Postal Code",
            hints: "Input (e.g 228209)",
            initialValue: "",
            innerPadding: widget.innerPadding ?? const EdgeInsets.symmetric(horizontal: 20),
            dividerIndent: 10,
            focusNode: _postalFocusNode.value,
            onEdit: (title, value) {
              setPostalCode(value);
            },
            onChange: (value, c) {
              int maxL = 6;
              if (value.length <= maxL) pCode = value;
              if (value.length > maxL) {
                c.value = TextEditingValue(
                  text: pCode,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: pCode.length),
                  ),
                );
                AppToasts.error(msg: "Max limit 6 char.");
              }
            },
            readOnly: false,
            pageReadOnly: false,
          ),
          BaseBorderlessInputText(
            labelText: "Address",
            hints: "Select or input (e.g Scotts Square,6 Scotts Road)",
            initialValue: "",
            innerPadding: widget.innerPadding ?? const EdgeInsets.symmetric(horizontal: 20),
            dividerIndent: 10,
            suggestionList: addressList.map((element) => element.streetDisplay.toString()).toList(),
            focusNode: _addressFocusNode.value,
            dataType: DataType.text,
            onEdit: (title, value) {
              widget.onEditAddress?.call(value);
            },
            readOnly: postCode.value.isEmpty ? true : false,
            pageReadOnly: postCode.value.isEmpty ? true : false,
            onTap: _addressFocusNode.value.hasFocus ? null : () {},
          ),
          BaseBorderlessInputText(
            labelText: "Floor / Unit",
            hints: "Input (e.g 3-12)",
            initialValue: "",
            innerPadding: widget.innerPadding ?? const EdgeInsets.symmetric(horizontal: 20),
            dividerIndent: 10,
            focusNode: _unitFocusNode.value,
            onEdit: (title, value) {
              widget.onEditFlor?.call(value);
            },
            readOnly: postCode.value.isEmpty ? true : false,
            pageReadOnly: postCode.value.isEmpty ? true : false,
            onTap: _unitFocusNode.value.hasFocus ? null : () {},
          ),
        ],
      ),
    );
  }
}

class Address {
  String? block;
  String? street;
  String? streetDisplay;
  String? building;
  String? postal;

  Address({this.block, this.street, this.streetDisplay, this.building, this.postal});

  Address.fromJson(Map<String, dynamic> json) {
    block = json['block'];
    street = json['street'];
    streetDisplay = json['street_display'];
    building = json['building'];
    postal = json['postal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['block'] = block;
    data['street'] = street;
    data['street_display'] = streetDisplay;
    data['building'] = building;
    data['postal'] = postal;
    return data;
  }
}
