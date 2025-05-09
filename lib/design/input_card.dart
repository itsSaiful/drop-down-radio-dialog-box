import 'package:drop_down_radio_dialog_box/colors/app_theme_colors.dart';
import 'package:drop_down_radio_dialog_box/design/custom_card_decoration.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;

  const InputCard(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.color,
      this.borderRadius,
      this.borderColor,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 8),
      padding: padding ?? EdgeInsets.all(12),
      decoration: CUSTOM_CARD_DECORATION.copyWith(
        color: color,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor ?? Colors.transparent, // Border color
          width: borderWidth ?? 1.0, // Border width
        ),
      ),
      child: child,
    );
  }
}

class InputCardTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const InputCardTitle({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color ?? primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
