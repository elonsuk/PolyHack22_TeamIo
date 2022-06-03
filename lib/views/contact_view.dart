import 'package:flutter/material.dart';
import 'command_view.dart';
import 'profile_view.dart';
import '../classes/payee.dart';

class ContactView extends StatelessWidget {
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
              Text('Group Members'),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            for (var payee in payees)
              ProfileView(
                payee: payee,
              ),
          ],
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
