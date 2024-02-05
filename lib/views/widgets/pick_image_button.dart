import 'package:flutter/material.dart';
import '../../controler/color.dart';
import 'custom_show_bottom_sheet.dart';

class CustomPickImageButton extends StatelessWidget {
  const CustomPickImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: mainColor,
      onPressed: () {
        customShowBottomSheet(context);
      },
      label: const Text(
        'Pick Image',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
