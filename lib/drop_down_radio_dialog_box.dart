import 'package:drop_down_radio_dialog_box/design/alert_box_text_field.dart';
import 'package:flutter/material.dart';

class DropDownRadioDialogBox extends StatefulWidget {
  const DropDownRadioDialogBox({super.key});

  @override
  State<DropDownRadioDialogBox> createState() => _DropDownRadioDialogBoxState();
}

class _DropDownRadioDialogBoxState extends State<DropDownRadioDialogBox> {
  final ValueNotifier<String?> selectedValue = ValueNotifier<String?>('');
  final ValueNotifier<String?> selectedIdValue = ValueNotifier<String?>('');
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    selectedValue.dispose();
    selectedIdValue.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DropDown Page")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AlertBoxTextFiled(
              //text filed title name
              textFiledTitle: "Select Value",
              // alert title name
              alertTitle: "Select Item",
              //add item
              items: const [
                "Item 1",
                "Item 2",
                "Item 3",
                "Item 4",
              ],
              itemsId: const [],
              selectedValue: selectedValue,
              selectedIdValue: selectedIdValue,
              controller: controller,
              confirmButtonText: "Ok",
              cancelButtonText: "Cancel",
            ),
          ),
        ],
      ),
    );
  }
}
