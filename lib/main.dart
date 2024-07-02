import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/presentation/registration_screen.dart';
import 'package:validation_form/uikit/theme/theme_data.dart';

void main() {
  runApp(const ValidationFormApp());
}

class ValidationFormApp extends StatelessWidget {
  const ValidationFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: const RegistrationFormWidget(),
      ),
    );
  }
}
