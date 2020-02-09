import 'package:flutter/material.dart';

import 'common/routes/router.dart';
import 'presentation/nasa_asteroids/nasa_asteroid_list_page.dart';

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
      home: Router.home,
      onGenerateRoute: Router.onGenerateRoute,
    );
  }
}
