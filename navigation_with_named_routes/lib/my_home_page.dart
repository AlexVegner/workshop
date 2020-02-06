import 'package:flutter/material.dart';
import 'package:navigation_with_named_routes/routing.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to second'),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.secondPage,
                arguments: 'Second page through name route');
          },
        ),
      ),
    );
  }
}
