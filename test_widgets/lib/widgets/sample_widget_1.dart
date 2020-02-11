import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleWidget1 extends StatelessWidget {
  final String title;
  final String message;

  const SampleWidget1({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}