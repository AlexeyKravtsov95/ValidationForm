import 'package:flutter/material.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class EmailFieldModel extends FormModel<TextEditingValue> {
  EmailFieldModel(TextEditingController controller)
      : super(initValue: controller.value) {
    controller.addListener(() {
      dataSource.value = controller.value;
    });
  }

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim();
    final emailAddressPattern = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailAddressPattern.hasMatch(text ?? '')) {
      return null;
    } else {
      return AppConstants.validatorEmptyEmailError;
    }
  }
}
