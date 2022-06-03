import 'package:flutter/material.dart';

class VerifyPaymentButton extends StatelessWidget {
  VerifyPaymentButton(
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
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressedFuncOne,
            child: Icon(
              buttonOneIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          Visibility(
            visible: showButtonTwo,
            child: SizedBox(
              width: 20,
            ),
          ),
          Visibility(
            visible: showButtonTwo,
            child: GestureDetector(
              onTap: onPressedFuncTwo,
              child: Icon(
                buttonTwoIcon,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
