import 'package:flutter/material.dart';

// This is basically like the driver.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "";

  void changeInput(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World App")),
        body: Column(children: <Widget>[
          TextInputWidget(callback: changeInput),
          Text(text)
        ]));
  }
}

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
