
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _nextPage();
  }

  void _nextPage() {
    Future.delayed(Duration(seconds: 1), () => Navigator.of(context).pushReplacementNamed('/login'));
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SplashPage'),
    );
  }
}