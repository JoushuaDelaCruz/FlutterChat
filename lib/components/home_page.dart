import 'package:flutter/material.dart';
import 'package:hello_world/components/text_input_widget.dart';
import 'package:hello_world/models/post.dart';
import 'package:hello_world/components/post_lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, "Default Author"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World App")),
        body: Column(children: <Widget>[
          Expanded(
              child: PostList(
            listsPosts: posts,
          )),
          TextInputWidget(callback: newPost),
        ]));
  }
}
