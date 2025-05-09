import 'package:drop_down_radio_dialog_box/colors/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BoxDecoration CUSTOM_CARD_DECORATION = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(6),
    boxShadow: const [
      BoxShadow(
        color: Color(0x26000000),
        blurRadius: 3,
        offset: Offset(0, 1),
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Color(0x4C000000),
        blurRadius: 2,
        offset: Offset(0, 1),
        spreadRadius: 0,
      )
    ]);

EdgeInsetsGeometry CUSTOM_CARD_PADDING = const EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 12,
);

EdgeInsetsGeometry CUSTOM_CARD_MARGIN = const EdgeInsets.symmetric(
  horizontal: 12,
);
