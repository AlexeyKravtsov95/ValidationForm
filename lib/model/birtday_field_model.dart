import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class DateFieldModel extends FormModel<TextEditingValue> {
  DateFieldModel(TextEditingController controller)
      : super(initValue: controller.value) {
    controller.addListener(() {
      dataSource.value = controller.value;
    });
  }

  @override
  String? getValidationError(TextEditingValue? value) {
    final text = value?.text.trim();
    if (text == null || text.isEmpty) {
      return AppConstants.validatorEmptyBirthdayError;
    }

    if (text.isNotEmpty) {
      final datePattern = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
      if (!datePattern.hasMatch(text)) {
        return AppConstants.validatorEmptyBirthdayError;
      }

      final date = DateFormat('dd.MM.yyyy').parse(text);
      final now = DateTime.now();
      final isToday = now.day == date.day &&
          now.month == date.month &&
          now.year == date.year;
      if (isToday) return AppConstants.validatorErrorDate;
    }

    return null;
  }
}
