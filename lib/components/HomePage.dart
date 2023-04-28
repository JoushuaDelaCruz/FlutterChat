import 'package:flutter/material.dart';
import 'package:hello_world/components/TextInputWidget.dart';

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
