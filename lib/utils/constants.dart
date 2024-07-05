import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String validatorEmptyNameError =
      "Укажите имя питомца от 3 до 20 символов";
  static const String validatorEmptyBirthdayError = "Укажите дату дд/мм/гггг";
  static const String validatorEmptyWeightError = "Укажите вес, больше 0 кг";
  static const String validatorEmptyEmailError = "Введите email";
  static const String validatorErrorDate = "Дата должна быть раньше текущей";

  static const String typeDog = "Собака";
  static const String typeCat = "Кошка";
  static const String typeParrot = "Попугай";
  static const String typeHamster = "Хомяк";

  static const String typeVaccineRabies = "бешенства";
  static const String typeVaccineCovid = "ковида";
  static const String typeVaccineMalaria = "малярии";

  static const String petInputField = "Имя питомца";
  static const String weightInputField = "Вес, кг";
  static const String birthdayInputField = "День рождения питомца";
  static const String emailInputField = "Почта хозяина";

  static const String graftLabel = "Сделаны прививки от:";
  static const String graftOfDateLabel = "Дата последней прививки";

  static const String sendLabelButton = "Отправить";
}

class ColorConst {
  ColorConst._();

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color colorBackground = Color(0xFFEAECEB);
  static const Color disabledButtonColor = Color(0xFFD3D5D8);
  static const Color textFieldColor = Color(0xFFAFB2BC);
  static const Color iconBackgroundActiveColor = Color(0xFFFF8087);
  static const Color errorColor = Color(0xFFFD4C56);
  static const Color primaryColor = Color(0xFF414657);
}
