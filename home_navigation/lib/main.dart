import 'package:flutter/material.dart';
import 'package:home_navigation/pages/home/home_page.dart';

import 'routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Navigation',
      routes: Router.routes,
      onGenerateRoute: Router.onGenerateRoute,
      onUnknownRoute: Router.onUnknownRoute,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
      ),
    );
  }
}
