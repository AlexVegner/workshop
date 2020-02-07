import 'package:flutter/material.dart';
import 'package:not_movie_widget_example/not_movies_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotMoviesPage(),
    );
  }
}
