import 'package:flutter/material.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class NameFieldModel extends FormModel<TextEditingValue> {
  NameFieldModel(TextEditingController controller)
      : super(initValue: controller.value) {
    controller.addListener(() {
      dataSource.value = controller.value;
    });
  }
  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim();
    if (text == null || text.isEmpty || text.length < 3 || text.length > 20) {
      return AppConstants.validatorEmptyNameError;
    }

    return null;
  }
}
