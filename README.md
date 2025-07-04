# Drop Down Radio Dialog Box

Drop Down Radio Dialog Box is a Flutter package that provides a customizable alert box with a list of radio buttons for selecting a value. This package is useful for scenarios where you need to prompt users to choose an option from a list within a dialog box.


![Drop Down Radio Dialog Box Preview](https://github.com/itsSaiful/drop-down-radio-dialog-box/blob/main/drop_down.gif)

![Alt Text](hompage.png) ![Alt Text](dialog_page.png)


## Features

* Display a list of selectable items inside an alert dialog.
* Customizable text field title and alert title.
* Supports custom button texts for confirmation and cancellation.
* Allows binding of selected value and ID.
* Easy to integrate and use in your Flutter project.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  drop_down_radio_dialog_box: ^1.0.0
```

Then, run:

```bash
flutter pub get
```

## Usage

Here’s a basic example of using the Drop Down Radio Dialog Box:

```dart
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
```

### Parameters

* `textFiledTitle` - Title for the text field.
* `alertTitle` - Title for the alert dialog.
* `items` - List of items to display as radio buttons.
* `itemsId` - List of item IDs (optional).
* `selectedValue` - Variable to hold the selected value.
* `selectedIdValue` - Variable to hold the selected ID.
* `controller` - TextEditingController for managing input.
* `confirmButtonText` - Text for the confirmation button.
* `cancelButtonText` - Text for the cancellation button.

## License

This package is licensed under the MIT License. See the LICENSE file for more information.
