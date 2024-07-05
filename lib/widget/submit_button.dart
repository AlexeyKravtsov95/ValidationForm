import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class SubmitFormButtonWidget extends StatefulWidget {
  const SubmitFormButtonWidget({
    super.key,
    required this.formKey,
    required this.isFormValid,
  });

  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> isFormValid;

  @override
  State<SubmitFormButtonWidget> createState() => _SubmitFormButtonWidgetState();
}

class _SubmitFormButtonWidgetState extends State<SubmitFormButtonWidget> {
  bool _isSending = false;

  Future<void> _sendData(FormModel formModel) async {
    if (mounted) {
      setState(() {
        _isSending = true;
      });
    }

    formModel.formSubmited = true;
    formModel.isReadyForSubmit = false;

    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    });

    formModel.isSubmited = false;
    formModel.isReadyForSubmit = true;
  }

  @override
  Widget build(BuildContext context) {
    FormModel fm = context.watch<FormModel>();
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ValueListenableBuilder<bool>(
        valueListenable: widget.isFormValid,
        builder: (context, isValid, _) {
          return ElevatedButton(
            onPressed: isValid && _isSending == false
                ? () async {
                    if (widget.formKey.currentState!.validate()) {
                      await _sendData(fm);
                    }
                  }
                : null,
            child: _isSending
                ? const SizedBox.square(
                    dimension: 24,
                    child: CircularProgressIndicator(
                      color: ColorConst.colorBackground,
                    ),
                  )
                : const Text(AppConstants.sendLabelButton),
          );
        },
      ),
    );
  }
}
