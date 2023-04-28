import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello_world/models/post.dart';

class PostList extends StatefulWidget {
  final List<Post> listsPosts;

  const PostList({Key? key, required this.listsPosts}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listsPosts.length,
      itemBuilder: (context, index) {
        var post = widget.listsPosts[index];
        return Card(
            child: Row(children: <Widget>[
          Expanded(
            child:
                ListTile(title: Text(post.body), subtitle: Text(post.author)),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(post.likes.toString(),
                    style: const TextStyle(fontSize: 20)),
              ),
              IconButton(
                icon: const Icon(Icons.thumb_up_sharp),
                onPressed: () => like(post.likePost),
                color: post.userLiked ? Colors.blue : Colors.black,
              )
            ],
          )
        ]));
      },
    );
  }
}
