import 'package:flutter/material.dart';

class Command {
  String? amount;
  String? number;
  List<Widget> payeeList = [];

  String returnAmount() {
    return this.amount!;
  }

  String returnNumber() {
    return this.number!;
  }

  List<Widget> returnPayeeList() {
    return this.payeeList;
  }
}
