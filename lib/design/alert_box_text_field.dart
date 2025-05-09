import 'package:drop_down_radio_dialog_box/design/app_text_field.dart';
import 'package:drop_down_radio_dialog_box/design/custom_radio_alert_dialog.dart';
import 'package:drop_down_radio_dialog_box/design/custom_radio_alert_group.dart';
import 'package:flutter/material.dart';

class AlertBoxTextFiled extends StatelessWidget {
  final ValueNotifier<String?> selectedValue;
  final String? alertTitle;
  final String? textFiledTitle;
  final ValueNotifier<String?>? selectedImageValue;
  final ValueNotifier<String?>? selectedIdValue;
  final ValueNotifier<String?>? selected2Value;
  final TextEditingController? controller;

  final String? cancelButtonText;
  final String? confirmButtonText;
  final List<String>? image;
  final int? maxLines;
  final List<String>? items;
  final List<String>? items2;
  final List<String>? itemsId;

  const AlertBoxTextFiled({
    super.key,
    this.textFiledTitle,
    this.alertTitle,
    this.selectedImageValue,
    this.selectedIdValue,
    this.image,
    this.items,
    this.items2,
    this.itemsId,
    this.controller,
    this.cancelButtonText,
    this.confirmButtonText,
    this.maxLines,
    required this.selectedValue,
    this.selected2Value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            final itemCount = items?.length ?? 0;
            final calculatedHeight = itemCount <= 3 ? 60.0 * itemCount : 200.0;

            return CustomRadioAlertDialog(
              title: alertTitle ?? "",
              cancelButtonText: cancelButtonText ?? "Cancel",
              confirmButtonText: confirmButtonText ?? 'Ok',
              child: SizedBox(
                height: calculatedHeight,
                child: SingleChildScrollView(
                  child: CustomRadioAlertGroup(
                    maxLines: maxLines ?? 1,
                    groupImageValue: selectedImageValue,
                    groupValue: selectedValue,
                    //if needed then you can add image
                    imagePaths: image ?? [],
                    //here need to add items list name
                    items: items ?? [],
                    items2: items2 ?? [],
                    itemIds: itemsId ?? [],
                    groupIdValue: selectedIdValue,
                    selected2Value: selected2Value,
                  ),
                ),
              ),
              onCancel: () {
                Navigator.pop(context);
              },
              onConfirm: () {
                controller?.text = selectedValue.value ?? "";
                if (selectedIdValue != null) {
                  selectedIdValue!.value = selectedIdValue?.value ?? "";
                }
                if (selected2Value != null) {
                  selected2Value!.value = selected2Value?.value ?? "";
                }
                if (selectedIdValue != null) {
                  selectedIdValue!.value = selectedIdValue?.value ?? "";
                }
                if (selectedImageValue != null) {
                  selectedImageValue!.value = selectedImageValue?.value ?? "";
                }
                if (selectedIdValue != null) {
                  selectedIdValue!.value = selectedIdValue?.value ?? "";
                }
                Navigator.pop(context);
              },
            );
          },
        );
      },
      child: AbsorbPointer(
        child: AppTextField(
          controller: controller,
          labelText: textFiledTitle ?? "",
          isRequired: false,
          suffix: Icon(
            Icons.arrow_drop_down,
            size: 25,
          ),
          readOnly: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class AlertBoxImageTextFiled extends StatelessWidget {
  final ValueNotifier<String?> selectedValue;
  final String? alertTitle;
  final String? textFiledTitle;
  final ValueNotifier<String?>? selectedImageValue;
  final ValueNotifier<String?>? selectedIdsValue;
  final TextEditingController? controller;

  final String? cancelButtonText;
  final String? confirmButtonText;
  final List<String>? image;
  final int? maxLines;
  final List<String>? items;
  final List<String>? itemsId;

  const AlertBoxImageTextFiled({
    super.key,
    this.textFiledTitle,
    this.alertTitle,
    this.selectedImageValue,
    this.selectedIdsValue,
    this.image,
    this.items,
    this.itemsId,
    this.controller,
    this.cancelButtonText,
    this.confirmButtonText,
    this.maxLines,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            final itemCount = items?.length ?? 0;
            // Determine height based on item count
            final calculatedHeight = itemCount <= 3
                ? 100.0 * itemCount
                : 400.0; // Adjust 400.0 to max desired height

            return CustomRadioAlertDialog(
              title: alertTitle ?? "",
              cancelButtonText: cancelButtonText ?? "Cancel",
              confirmButtonText: confirmButtonText ?? 'Ok',
              child: SizedBox(
                height: calculatedHeight,
                child: SingleChildScrollView(
                  child: CustomRadioImageAlertGroup(
                    maxLines: maxLines ?? 1,
                    groupImageValue: selectedImageValue,
                    groupValue: selectedValue,
                    imagePaths: image ?? [],
                    items: items ?? [],
                    itemIds: itemsId ?? [],
                    groupIdsValue: selectedIdsValue,
                  ),
                ),
              ),
              onCancel: () {
                Navigator.pop(context);
              },
              onConfirm: () {
                controller?.text = selectedValue.value ?? "";
                if (selectedIdsValue != null) {
                  selectedIdsValue!.value = selectedIdsValue?.value ?? "";
                }
                if (selectedImageValue != null) {
                  selectedImageValue!.value = selectedImageValue?.value ?? "";
                }
                if (selectedIdsValue != null) {
                  selectedIdsValue!.value = selectedIdsValue?.value ?? "";
                }
                Navigator.pop(context);
              },
            );
          },
        );
      },
      child: AbsorbPointer(
        child: AppTextField(
          controller: controller,
          labelText: textFiledTitle ?? "",
          isRequired: false,
          suffix: const Icon(
            Icons.arrow_drop_down,
            size: 25,
          ),
          readOnly: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
