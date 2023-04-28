import 'package:flutter/material.dart';

// Responsible for Other parameters needed
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  const TextInputWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

// Responsible for state and rendering
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void messageSent() {
    FocusScope.of(context).unfocus();
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          labelText: "Search for a country",
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            tooltip: "Sends message",
            splashColor: Colors.blue,
            onPressed: messageSent,
          )),
    );
  }
}
