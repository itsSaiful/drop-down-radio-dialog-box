import 'package:drop_down_radio_dialog_box/colors/app_theme_colors.dart';
import 'package:drop_down_radio_dialog_box/design/sq_button.dart';
import 'package:flutter/material.dart';

class CustomRadioAlertDialog extends StatelessWidget {
  final String title;
  final Widget? child;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomRadioAlertDialog({
    super.key,
    required this.title,
    this.child,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: primaryColor,
        ),
      ),
      content: child,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomSqButton(
              boxShadowOn: false,
              color: white,
              buttonName: cancelButtonText,
              buttonTextColor: black,
              onPressed: onCancel,
            ),
            const SizedBox(width: 8),
            CustomSqButton(
              radius: 4,
              boxShadowOn: false,
              color: primaryColor,
              buttonName: confirmButtonText,
              fontWeight: FontWeight.w500,
              buttonTextColor: white,
              onPressed: onConfirm,
            ),
          ],
        ),
      ],
    );
  }
}
