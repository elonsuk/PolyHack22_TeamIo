import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/num_input_widget.dart';
import 'contact_view.dart';
import 'payment_validation_view.dart';
import '../functions/payee_list.dart';
import '../classes/command.dart';

bool paymentLinkComplete = false;
bool payeeLinkComplete = false;

class CommandView extends StatefulWidget {
  const CommandView({Key? key}) : super(key: key);

  @override
  State<CommandView> createState() => _CommandViewState();
}

class _CommandViewState extends State<CommandView> {
  Command c = Command();

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
                          MainView(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              Text('Send Payment Command'),
            ],
          ),
        ),
        body: Container(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                NumInputWidget(
                  widget_description: 'Total Payment Amount',
                  widget_instruction: 'Enter Amount',
                  include_text_field: true,
                  include_icon_button: true,
                  navigationScreen: PaymentValidationView(),
                  inputValue: c.amount,
                  isComplete: paymentLinkComplete,
                ),
                SizedBox(
                  height: 10.0,
                ),
                NumInputWidget(
                  widget_description: 'Payee Count',
                  widget_instruction: 'Enter Number',
                  include_text_field: true,
                  include_icon_button: false,
                  isInt: true,
                  inputValue: c.number,
                  isComplete: payeeLinkComplete,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: [
                    NumInputWidget(
                      widget_description: 'Payees',
                      include_text_field: false,
                      include_icon_button: true,
                      navigationScreen: ContactView(),
                      isComplete: payeeAdded(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: payeeList,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    child: Text('Send Payment Request'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
