import 'dart:convert';
import 'package:drop_down_radio_dialog_box/colors/app_theme_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioAlertGroup extends StatelessWidget {
  final ValueNotifier<String?> groupValue;
  final ValueNotifier<String?>? selected2Value;
  final ValueNotifier<String?>? groupImageValue;
  final ValueNotifier<String?>? groupIdValue;
  final List<String> items;
  final List<String>? items2;
  final List<String?>? itemIds;
  final List<String?>? imagePaths;
  final Function(String?, String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  CustomRadioAlertGroup({
    required this.groupValue,
    this.groupImageValue,
    this.groupIdValue,
    required this.items,
    this.itemIds,
    this.imagePaths,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.items2,
    this.selected2Value,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: groupValue.value,
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final itemId = itemIds != null && index < itemIds!.length
                    ? itemIds![index]
                    : null;
                final imagePath =
                    imagePaths != null && index < imagePaths!.length
                        ? imagePaths![index]
                        : null;

                final imageWidget = imagePath != null
                    ? Image.asset(
                        imagePath,
                        width: 46,
                        height: 44,
                      )
                    : const SizedBox();

                return GestureDetector(
                  onTap: () {
                    // Update groupValue and groupIdValue on tap
                    groupValue.value = item;
                    if (groupImageValue != null && imagePaths != null) {
                      groupImageValue!.value = imagePath;
                    }

                    if (itemId != null) {
                      groupIdValue!.value = itemId;
                      print("Tapped Item ID: ${groupIdValue!.value}");
                    }

                    state.didChange(itemId);
                    onChanged?.call(item, itemId);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    key: Key(item),
                    children: [
                      Radio<String>(
                        fillColor: const WidgetStatePropertyAll(primaryColor),
                        value: item,
                        groupValue: groupValue.value,
                        onChanged: (v) {
                          // Update groupValue and groupIdValue on radio selection
                          groupValue.value = v;
                          if (groupImageValue != null && imagePaths != null) {
                            final index = items.indexOf(v!);
                            if (index != -1 && index < imagePaths!.length) {
                              groupImageValue?.value = imagePaths![index];
                            }
                          }

                          if (groupIdValue != null && itemIds != null) {
                            final index = items.indexOf(v!);
                            if (index != -1 && index < itemIds!.length) {
                              groupIdValue?.value = itemIds![index];
                              print(
                                  "Radio Changed Item ID: ${groupIdValue!.value}");
                            }
                          }

                          state.didChange(v);
                          onChanged?.call(v, groupIdValue?.value);
                        },
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            imageWidget,
                            SizedBox(width: 4),
                            Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLines,
                              style: const TextStyle(color: Color(0xff003041)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 8.0),
                child: Text(
                  state.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class CustomRadioImageAlertGroup extends StatelessWidget {
  final ValueNotifier<String?> groupValue;
  final ValueNotifier<String?>? groupImageValue;
  final ValueNotifier<String?>? groupIdsValue;

  final List<String> items;
  final List<String?>? itemIds;
  final List<String?>? imagePaths;
  final Function(String?, String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  CustomRadioImageAlertGroup({
    required this.groupValue,
    this.groupImageValue,
    this.groupIdsValue,
    required this.items,
    this.itemIds,
    this.imagePaths,
    this.onChanged,
    this.validator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: groupValue.value,
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final itemId = itemIds != null && index < itemIds!.length
                    ? itemIds![index]
                    : null;
                final imagePath =
                    imagePaths != null && index < imagePaths!.length
                        ? imagePaths![index]
                        : null;

                final imageWidget = imagePath != null
                    ? Image.memory(
                        base64Decode(imagePath),
                        width: 40,
                        height: 70,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/team_icon/supercreate_cem.png",
                            width: 70,
                            height: 92,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : const SizedBox();

                return GestureDetector(
                  onTap: () {
                    // Update groupValue and groupIdValue on tap
                    groupValue.value = item;
                    if (groupImageValue != null && imagePaths != null) {
                      groupImageValue!.value = imagePath;
                    }

                    if (itemId != null) {
                      groupIdsValue!.value = itemId;
                      print("Tapped Item ID: ${groupIdsValue!.value}");
                    }

                    state.didChange(itemId);
                    onChanged?.call(item, itemId);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    key: Key(item),
                    children: [
                      Radio<String>(
                        fillColor: const WidgetStatePropertyAll(primaryColor),
                        value: item,
                        groupValue: groupValue.value,
                        onChanged: (v) {
                          // Update groupValue and groupIdValue on radio selection
                          groupValue.value = v;

                          if (groupImageValue != null && imagePaths != null) {
                            final index = items.indexOf(v!);
                            if (index != -1 && index < imagePaths!.length) {
                              groupImageValue?.value = imagePaths![index];
                            }
                          }

                          if (groupIdsValue != null && itemIds != null) {
                            final index = items.indexOf(v!);
                            if (index != -1 && index < itemIds!.length) {
                              groupIdsValue?.value = itemIds![index];
                              print(
                                  "Radio Changed Item ID: ${groupIdsValue!.value}");
                            }
                          }

                          state.didChange(v);
                          onChanged?.call(v, groupIdsValue?.value);
                        },
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            imageWidget,
                            SizedBox(width: 4),
                            Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLines,
                              style: const TextStyle(color: Color(0xff003041)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 8.0),
                child: Text(
                  state.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
