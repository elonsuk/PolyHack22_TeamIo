import 'package:flutter/material.dart';

class ReceiptDetailRow extends StatelessWidget {
  ReceiptDetailRow({required this.displayDetails});
  final String displayDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(displayDetails),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
