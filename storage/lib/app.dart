import 'package:flutter/material.dart';
import 'package:storage/presentation/pages/asteroid_list/asteroid_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asteroid Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AsteroidListPage(),
    );
  }
}
