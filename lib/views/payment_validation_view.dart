import 'package:flutter/material.dart';
import 'command_view.dart';
import 'link_receipt_view.dart';
import 'link_payment_view.dart';

class PaymentValidationView extends StatefulWidget {
  const PaymentValidationView({Key? key}) : super(key: key);

  @override
  State<PaymentValidationView> createState() => _PaymentValidationViewState();
}

class _PaymentValidationViewState extends State<PaymentValidationView> {
  bool linkReceipt = true;
  bool linkPayment = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          CommandView(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              Text('Verify Payment'),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('Link Receipt'),
                    onPressed: () {
                      setState(() {
                        linkReceipt = true;
                        linkPayment = false;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: Text('Link Payment'),
                    onPressed: () {
                      setState(() {
                        linkReceipt = false;
                        linkPayment = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: linkReceipt,
                child: LinkReceiptView(),
              ),
              Visibility(
                visible: linkPayment,
                child: LinkPaymentView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
