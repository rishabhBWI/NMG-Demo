import 'package:flutter/material.dart';
import 'package:ngm/modals/authors.dart';
import 'package:ngm/modals/posts.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  final User user;

  const PostDetails({super.key, required this.post, required this.user});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${widget.user.name}'),
      ),
      body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.post.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .merge(TextStyle(fontSize: 18)),
              ),
              Text(
                widget.post.body,
              ),
            ],
          )),
    );
  }
}
