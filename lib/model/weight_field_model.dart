import 'package:flutter/material.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class WeightFieldModel extends FormModel<TextEditingValue> {
  WeightFieldModel(TextEditingController controller)
      : super(initValue: controller.value) {
    controller.addListener(() {
      dataSource.value = controller.value;
    });
  }

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim() ?? '';
    final weight = double.tryParse(text) ?? 0;
    if (weight <= 0) {
      return AppConstants.validatorEmptyWeightError;
    }

    return null;
  }
}
