import 'package:flutter/foundation.dart';
import 'package:validation_form/data/vaccine_type.dart';

class FormModel<T> extends ChangeNotifier {
  final List<VaccineType> vaccines = [];
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<T?> dataSource;
  final bool isRequired = true;
  var _hasInteracted = false;
  bool isSubmited = false;
  bool _isReadyForSubmit = false;

  ValueListenable<String?> get error => _errorNotifier;

  FormModel({T? initValue}) : dataSource = ValueNotifier<T?>(initValue);

  bool get valid {
    if (isRequired && !_hasInteracted) validate();
    return _errorNotifier.value == null;
  }

  void validate() {
    _hasInteracted = true;
    _errorNotifier.value = getValidationError(dataSource.value);
  }

  @override
  void dispose() {
    _errorNotifier.dispose();
    vaccines.clear();
    super.dispose();
  }

  String? getValidationError(T? value) {
    return value?.toString();
  }

  set formSubmited(bool value) {
    isSubmited = value;
    notifyListeners();
  }

  bool get formSubmited {
    return isSubmited;
  }

  bool isVaccinated(VaccineType vaccineType) {
    return vaccines.contains(vaccineType);
  }

  void toggleVaccination(VaccineType vaccineType) {
    if (vaccines.contains(vaccineType)) {
      vaccines.remove(vaccineType);
    } else {
      vaccines.add(vaccineType);
    }
    notifyListeners();
  }

  set isReadyForSubmit(bool value) {
    _isReadyForSubmit = value;
    notifyListeners();
  }

  bool get isReadyForSubmit {
    return _isReadyForSubmit;
  }
}
