import 'package:drop_down_radio_dialog_box/colors/app_colors.dart';
import 'package:drop_down_radio_dialog_box/colors/app_theme_colors.dart';
import 'package:drop_down_radio_dialog_box/design/input_card.dart';
import 'package:flutter/material.dart';

class CustomSqButton extends StatelessWidget {
  const CustomSqButton({
    super.key,
    this.onPressed,
    this.color = AppColorsLH.lhSysLightOnSurface,
    required this.buttonName,
    this.buttonTextColor,
    this.prevWidget,
    this.boxShadowOn = false,
    this.radius = 8,
    this.border,
    this.boxShadow,
    this.fontWeight,
  });

  final GestureTapCallback? onPressed;
  final Color color;
  final FontWeight? fontWeight;
  final Color? buttonTextColor;
  final String buttonName;
  final Widget? prevWidget;
  final bool boxShadowOn;
  final double radius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          boxShadow: boxShadowOn
              ? boxShadow ??
                  [
                    BoxShadow(
                      color: AppColorsLH.lhSysLightShadow,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ]
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prevWidget != null) prevWidget!,
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: buttonTextColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSqButtonWhite extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final Color? buttonTextColor;
  final String buttonName;
  final Widget? prevWidget;
  final double radius;

  const CustomSqButtonWhite({
    super.key,
    this.onPressed,
    this.buttonTextColor,
    required this.buttonName,
    this.prevWidget,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: InputCard(
        borderRadius: BorderRadius.circular(8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prevWidget != null) prevWidget!,
            if (prevWidget != null)
              Text(
                buttonName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: buttonTextColor ?? primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
