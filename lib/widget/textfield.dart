import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/model/form_model.dart';

class FieldWidget extends StatefulWidget {
  const FieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    required this.formModel,
    required this.label,
    required this.inputType,
    this.onTap,
    required this.onFieldChanged,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final FormModel formModel;
  final String label;
  final VoidCallback? onTap;
  final VoidCallback onFieldChanged;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  late final _focusNode = widget.focusNode ?? FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.formModel.validate();
      widget.onFieldChanged();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final fm = context.watch<FormModel>();

    return ValueListenableBuilder(
      valueListenable: widget.formModel.error,
      builder: (_, error, __) => TextFormField(
        onTap: fm.formSubmited ? null : widget.onTap,
        controller: widget.controller,
        enabled: !fm.formSubmited,
        focusNode: _focusNode,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: error,
        ),
      ),
    );
  }
}
