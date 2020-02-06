import 'package:flutter/material.dart';
import 'package:home_navigation/pages/dashboard/dashboard_page.dart';
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

  ///   settings/profile/edit/?title=Matrix&year=2010

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '') {
      return null;
    } else if (pathElements[1] == Routes.favoriteDetailsPath) {
      return MaterialPageRoute(
        builder: (context) {
          return DashboardPage();
        },
      );
    }
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