import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  Message(this.message);

  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
