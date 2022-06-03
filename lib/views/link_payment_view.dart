import 'package:flutter/material.dart';
import '../widgets/verify_payment_button.dart';

class LinkPaymentView extends StatelessWidget {
  const LinkPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            VerifyPaymentButton(
              buttonOneIcon: Icons.check,
              onPressedFuncOne: () {},
              showButtonTwo: false,
            ),
          ],
        ),
      ),
    );
  }
}
