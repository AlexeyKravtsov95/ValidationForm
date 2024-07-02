import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_form/model/form_model.dart';
import 'package:validation_form/utils/constants.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.isVaccinated,
    required this.onChanged,
    required this.label,
    required this.child,
  });

  final bool isVaccinated;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final fm = context.watch<FormModel>();
    return GestureDetector(
      onTap: fm.formSubmited ? null : () => onChanged(!isVaccinated),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: const BorderSide(color: Colors.white),
                      activeColor: Theme.of(context).colorScheme.secondary,
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.focused) ||
                            states.contains(WidgetState.selected) ||
                            states.contains(WidgetState.pressed)) {
                          return Theme.of(context)
                              .colorScheme
                              .secondaryContainer;
                        } else {
                          return Theme.of(context).colorScheme.primaryContainer;
                        }
                      }),
                      checkColor: Theme.of(context).colorScheme.onPrimary,
                      value: isVaccinated,
                      onChanged: fm.formSubmited ? null : onChanged,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorConst.primaryColor),
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: isVaccinated ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Visibility(
                visible: isVaccinated,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    child,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
