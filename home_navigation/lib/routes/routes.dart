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
  static const String favoriteDetails = '/$favoriteDetailsPath';
  static const String notFoundPath = 'notFound';
  static const String notFound = '/$notFoundPath';
}