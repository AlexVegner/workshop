
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Video'),
      ),
      body: Center(
        child: Container(
          child: Text('DashboardPage'),
        ),
      ),
    );
  }
}