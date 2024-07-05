import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/data/pet_type.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class PetButtonGroupWidget<T extends PetType> extends StatelessWidget {
  const PetButtonGroupWidget({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onChanged,
  });
  final T value;
  final bool isSelected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    FormModel fm = context.watch<FormModel>();
    return Column(
      children: [
        GestureDetector(
          onTap: fm.formSubmited ? null : () => onChanged(value),
          child: SizedBox.square(
            dimension: 72,
            child: Opacity(
              opacity: fm.formSubmited ? 0.5 : 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorConst.iconBackgroundActiveColor
                      : ColorConst.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  value.icon,
                  color: isSelected
                      ? ColorConst.whiteColor
                      : ColorConst.primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
