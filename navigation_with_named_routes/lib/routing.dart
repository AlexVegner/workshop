import 'package:flutter/material.dart';
import 'package:navigation_with_named_routes/my_home_page.dart';
import 'package:navigation_with_named_routes/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initialPage:
        return MaterialPageRoute(
            builder: (_) => MyHomePage(
                  title: 'HomePage',
                ));
      case Routes.secondPage:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              title: args,
            ),
          );
        }
        // return error route if the argument type is not right
        return _errorRoute();
      default:
        // return error route if named route was not found
        return _errorRoute();
    }
  }

  // _errorRoute is just a screen with error.
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class Routes {
  static const String initialPage = '/';
  static const String secondPage = '/second';
}
