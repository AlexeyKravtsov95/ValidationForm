import 'package:validation_form/utils/constants.dart';

enum PetType {
  dog(AppConstants.typeDog, 'assets/icons/dog.png'),
  cat(AppConstants.typeCat, 'assets/icons/cat.png'),
  parrot(AppConstants.typeParrot, 'assets/icons/parrot.png'),
  hamster(AppConstants.typeHamster, 'assets/icons/hamster.png');

  final String name;
  final String icon;

  const PetType(this.name, this.icon);
}
