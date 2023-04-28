import 'package:flutter/material.dart';
import "../components/home_page.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login Page")), body: const Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = TextEditingController();

  void newUser() {
    name = controller.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  name: name,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: "Enter your name",
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.grey)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.done),
                splashColor: Colors.green,
                tooltip: "Submit",
                onPressed: newUser,
              ),
            ),
          ),
        ));
  }
}
