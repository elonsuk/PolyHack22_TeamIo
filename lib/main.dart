import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'views/chat_view.dart';
import 'views/command_view.dart';

void main() => runApp(MainView());

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: ChatView(),
      ),
    );
  }
}
