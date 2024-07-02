import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/data/pet_type.dart';
import 'package:validation_form/data/vaccine_type.dart';
import 'package:validation_form/model/birtday_field_model.dart';
import 'package:validation_form/model/email_field_model.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/model/name_field_model.dart';
import 'package:validation_form/model/weight_field_model.dart';
import 'package:validation_form/utils/constants.dart';
import 'package:validation_form/widget/checkbox.dart';
import 'package:validation_form/widget/radio_button.dart';
import 'package:validation_form/widget/submit_button.dart';
import 'package:validation_form/widget/textfield.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final _key = GlobalKey<FormState>();
  final ValueNotifier<PetType> _setPet = ValueNotifier<PetType>(PetType.dog);
  final _isFormValid = ValueNotifier<bool>(false);
  bool _disableValid = false;
  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _weightController = TextEditingController();
  final _emailController = TextEditingController();
  final _graftOfDateController = TextEditingController();
  late final _nameField = NameFieldModel(_nameController);
  late final _birthdayField = DateFieldModel(_birthdayController);
  late final _weightField = WeightFieldModel(_weightController);
  late final _emailField = EmailFieldModel(_emailController);
  late final _graftDateField = DateFieldModel(_graftOfDateController);

  List<FormModel> get _fields => [
        _nameField,
        _weightField,
        _birthdayField,
        _emailField,
      ];

  List<FormModel> get _allFields => [
        _nameField,
        _weightField,
        _birthdayField,
        _emailField,
        _graftDateField,
      ];
  List<TextEditingController> get _controllers => [
        _nameController,
        _birthdayController,
        _weightController,
        _emailController,
        _graftOfDateController,
      ];

  @override
  void initState() {
    super.initState();
    for (final field in _allFields) {
      field.addListener(_validateForm);
    }
  }

  @override
  void dispose() {
    for (final field in _allFields) {
      field.dispose();
    }
    _isFormValid.dispose();
    super.dispose();
  }

  void _validateForm() {
    if (_disableValid) return;

    final allFieldsValid = _fields.every((field) => field.valid);

    final graftFieldsValid =
        (_setPet.value == PetType.cat || _setPet.value == PetType.dog)
            ? _graftDateField.valid
            : true;
    _isFormValid.value = allFieldsValid && graftFieldsValid;
  }

  void _toggleValid(bool disable) {
    setState(() {
      _disableValid = disable;
    });
  }

  void _clearFormFields() {
    for (final controller in _controllers) {
      controller.clear();
    }
    for (final field in _fields) {
      field.dataSource.value = null;
    }
    _isFormValid.value = false;
  }

  Widget _buildField(
    TextEditingController controller,
    FormModel formModel,
    String label,
    TextInputType inputType, {
    VoidCallback? onTap,
  }) {
    return FieldWidget(
      controller: controller,
      formModel: formModel,
      label: label,
      inputType: inputType,
      onTap: onTap,
      onFieldChanged: _validateForm,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fm = context.watch<FormModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: ValueListenableBuilder<PetType>(
                    valueListenable: _setPet,
                    builder: (context, value, child) {
                      return Form(
                        key: _key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: PetType.values.map((petType) {
                                return PetButtonGroupWidget(
                                  value: petType,
                                  isSelected: _setPet.value == petType,
                                  onChanged: (value) {
                                    _toggleValid(true);
                                    setState(() {
                                      _setPet.value = value;
                                      _clearFormFields();
                                    });
                                    _toggleValid(false);
                                  },
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            _buildField(
                              _nameController,
                              _nameField,
                              AppConstants.petInputField,
                              TextInputType.name,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildField(
                              _birthdayController,
                              _birthdayField,
                              AppConstants.birthdayInputField,
                              TextInputType.datetime,
                              onTap: () =>
                                  _showDatePicker(context, _birthdayController),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildField(
                              _weightController,
                              _weightField,
                              AppConstants.weightInputField,
                              TextInputType.number,
                            ),
                            const SizedBox(height: 16),
                            _buildField(
                              _emailController,
                              _emailField,
                              AppConstants.emailInputField,
                              TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            if (value != PetType.hamster &&
                                value != PetType.parrot)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppConstants.graftLabel,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 16),
                                  ...VaccineType.values.map(
                                    (vaccineType) {
                                      return CheckBoxWidget(
                                        isVaccinated: fm.isVaccinated(
                                          vaccineType,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            fm.toggleVaccination(vaccineType);
                                            _validateForm();
                                          }
                                        },
                                        label: vaccineType.name,
                                        child: _buildField(
                                          _graftOfDateController,
                                          _graftDateField,
                                          AppConstants.graftOfDateLabel,
                                          TextInputType.datetime,
                                          onTap: () => _showDatePicker(
                                              context, _graftOfDateController),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SubmitFormButtonWidget(
                formKey: _key,
                isFormValid: _isFormValid,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );

    if (pickedDate != null) {
      controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
    }
  }
}
