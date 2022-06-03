import 'package:flutter/material.dart';
import 'package:group_payment/views/command_view.dart';

class NumInputWidget extends StatefulWidget {
  NumInputWidget(
      {required this.widget_description,
      this.widget_instruction,
      required this.include_text_field,
      required this.include_icon_button,
      this.navigationScreen,
      this.isInt,
      this.inputValue,
      this.onChangedFunc,
      required this.isComplete});

  final String widget_description;
  final String? widget_instruction;
  final bool include_text_field;
  final bool include_icon_button;
  final Widget? navigationScreen;
  final bool? isInt;
  var inputValue;
  final VoidCallback? onChangedFunc;
  bool isComplete;

  @override
  State<NumInputWidget> createState() => _NumInputWidgetState();
}

class _NumInputWidgetState extends State<NumInputWidget> {
  final controller = TextEditingController();

  String? get intErrorText {
    final text = controller.value.text;

    if (text.contains('.') || text.contains(',')) {
      return 'Invalid value';
    }

    return null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.widget_description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Visibility(
                    visible: widget.isComplete,
                    child: Icon(
                      Icons.check,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: widget.include_text_field,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: widget.widget_instruction,
                    errorText: widget.isInt != null
                        ? (widget.isInt! ? intErrorText : null)
                        : null,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => widget.inputValue),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.include_icon_button && !widget.isComplete,
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      widget.navigationScreen!,
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
