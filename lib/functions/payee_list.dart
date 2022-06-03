import 'package:flutter/material.dart';

List<Widget> payeeList = [];

void addPayee(String imagePath) {
  payeeList.add(
    Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    ),
  );
}

bool payeeAdded() {
  if (payeeList.length == 0) {
    return false;
  }

  return true;
}
