import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;

  SecondPage({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.battery_charging_full),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(title),
      ),
    );
  }
}
