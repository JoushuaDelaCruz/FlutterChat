import 'package:flutter/material.dart';
import '/components/text_input_widget.dart';
import '../models/post.dart';
import '/components/post_lists.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, widget.name));
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
