import 'package:flutter/material.dart';

class LinkReceiptButton extends StatelessWidget {
  LinkReceiptButton(
      {required this.buttonOneIcon,
      required this.onPressedFuncOne,
      required this.showButtonTwo,
      this.buttonTwoIcon,
      this.onPressedFuncTwo});

  final IconData buttonOneIcon;
  final VoidCallback onPressedFuncOne;

  final bool showButtonTwo;
  final IconData? buttonTwoIcon;
  final VoidCallback? onPressedFuncTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: onPressedFuncOne,
          child: Icon(
            buttonOneIcon,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Visibility(
          visible: showButtonTwo,
          child: GestureDetector(
            onTap: onPressedFuncTwo,
            child: Icon(
              buttonTwoIcon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
