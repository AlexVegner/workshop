import 'dart:convert';

import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String homePath = 'home';
  static const String home = '/$homePath';
  static const String dashboardPath = 'dashboard';
  static const String dashboard = '$home/$dashboardPath';
  static const String searchPath = 'search';
  static const String search = '$home/$searchPath';
  static const String favoriteListPath = 'favoriteList';
  static const String favoriteList = '$home/$favoriteListPath';
  static const String settingsPath = 'favoriteList';
  static const String settings = '$home/$settingsPath';
  static const String favoriteDetailsPath = 'favoriteDetails';
  static const String favoriteDetailsNewPath = 'new';
  static const String favoriteDetailsNewAsteroidParameter = 'asteroid';
  static const String favoriteDetails = '/$favoriteDetailsPath';
  static const String notFoundPath = 'notFound';
  static const String notFound = '/$notFoundPath';

  static String createFavoriteDetails(NasaAsteroid asteroid) {
    return '/$favoriteDetailsPath/new?asteroid=${Uri.encodeQueryComponent(jsonEncode(asteroid.toJson()))}';
  }

  static String editFavoriteDetails(String id) {
    return '/$favoriteDetailsPath/$id';
  }
}