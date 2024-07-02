import 'package:validation_form/utils/constants.dart';

enum VaccineType {
  rabies(AppConstants.typeVaccineRabies),
  covid(AppConstants.typeVaccineCovid),
  malaria(AppConstants.typeVaccineMalaria);

  const VaccineType(this.name);

  final String name;
}
