import 'package:flutter/material.dart';
import 'package:home_navigation/pages/home/home_page.dart';
import 'package:home_navigation/pages/login/login_page.dart';
import 'package:home_navigation/pages/not_found/not_found_page.dart';
import 'package:home_navigation/pages/splash/splash_page.dart';
import 'package:home_navigation/routes/routes.dart';

abstract class Router {
  static Map<String, WidgetBuilder> routes = {
    Routes.splash: (BuildContext context) => SplashPage(),
    Routes.login: (BuildContext context) => LoginPage(),
    Routes.home: (BuildContext context) => HomePage(),
    Routes.dashboard: (BuildContext context) => HomePage(page: HomePageOptions.dashboard,),
    Routes.search: (BuildContext context) => HomePage(page: HomePageOptions.serarch,),
    Routes.favoriteList: (BuildContext context) => HomePage(page: HomePageOptions.favorite,),
    Routes.settings: (BuildContext context) => HomePage(page: HomePageOptions.settings,),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return null;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return NotFoundPage();
        },
      );
  }

}