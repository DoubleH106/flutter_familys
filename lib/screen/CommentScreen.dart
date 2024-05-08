import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RunCommentScreen();
  }
}

class RunCommentScreen extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Commnet"),
      ),
    );
  }
}
