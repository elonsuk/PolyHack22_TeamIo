import 'package:flutter/material.dart';
import 'package:group_payment/widgets/receipt_detail_row.dart';
import 'dart:async';
import 'dart:io';
import '../functions/process_receipt.dart';
import '../views/receipt_details_view.dart';

File? showImage;

class ReceiptDetailsView extends StatefulWidget {
  const ReceiptDetailsView({Key? key}) : super(key: key);

  @override
  State<ReceiptDetailsView> createState() => _ReceiptDetailsViewState();
}

class _ReceiptDetailsViewState extends State<ReceiptDetailsView> {
  Future<dynamic> loadProcessedReceipt() async {
    ReceiptProcessor rp = ReceiptProcessor();
    return await rp.processReceipt(showImage!);
  }

  late Future<dynamic> processedReceipt;

  @override
  void initState() {
    super.initState();
    processedReceipt = loadProcessedReceipt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<dynamic>(
        future: processedReceipt,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data != null) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReceiptDetailRow(
                        displayDetails:
                            '${snapshot.data[1]} ${snapshot.data[0]} purchased at ${snapshot.data[2]}',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReceiptDetailRow(
                        displayDetails: 'Purchase List:',
                      ),
                      for (var item in snapshot.data[3])
                        ReceiptDetailRow(
                          displayDetails:
                              '${item[1]} | ${item[0]}(s) => ${item[2]}',
                        ),
                    ],
                  ),
                );
              }
          }
          return Text('Error');
        },
      ),
    );
  }
}
