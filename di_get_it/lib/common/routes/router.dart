import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storage/common/routes/routes.dart';
import 'package:storage/data/favorite_asteroid/models/favorite_asteroid.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';
import 'package:storage/presentation/favorite_asteroid_deteils/bloc/favorite_asteroid_details_bloc.dart';
import 'package:storage/presentation/favorite_asteroid_deteils/favorite_asteroid_details_page.dart';
import 'package:storage/presentation/favorite_asteroid_list/bloc/favorite_asteroid_list_bloc.dart';
import 'package:storage/presentation/home/home_page.dart';
import 'package:storage/presentation/nasa_asteroids/bloc/nasa_asteroid_bloc.dart';
import 'package:storage/presentation/not_found/not_found_page.dart';
import 'package:storage/presentation/splash/splash_page.dart';
import 'package:storage/common/config/injector.dart';

abstract class Router {
  static Widget home = _buildHomePage(page: HomePageOptions.serarch);

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _buildSplashRoute(settings);
      case Routes.home:
        return _buildHomeRoute(settings);
      case Routes.dashboard:
        return _buildDashboardRoute(settings);
      case Routes.search:
        return _buildSearchRoute(settings);
      case Routes.favoriteList:
        return _buildFavoriteRoute(settings);
      case Routes.settings:
        return _buildSettingsRoute(settings);
    }

    final uri = Uri.parse(settings.name);
    final List<String> pathElements = uri.path.split('/');
    if (pathElements[1] == Routes.favoriteDetailsPath) {
      if (pathElements[2] == Routes.favoriteDetailsNewPath) {
        final asteroidJson =
            uri.queryParameters[Routes.favoriteDetailsNewAsteroidParameter];
        final asteroidRaw = jsonDecode(asteroidJson);
        final asteroid = FavoriteAsteroid.fromJson(asteroidRaw);
        return _buildFavoriteDetailsRoute(settings, asteroid: asteroid);
      } else {
        final id = pathElements[2];
        return _buildFavoriteDetailsRoute(settings, id: id);
      }
    }

    return null;
  }

  static Route _buildSplashRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => SplashPage(),
    );
  }

  static Route _buildHomeRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(),
    );
  }

  static Widget _buildHomePage({HomePageOptions page}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NasaAsteroidBloc>(
          create: (BuildContext context) => getIt<NasaAsteroidBloc>(),
        ),
        BlocProvider<FavoriteAsteroidListBloc>(
          create: (BuildContext context) => getIt<FavoriteAsteroidListBloc>(),
        ),
      ],
      child: HomePage(page: page),
    );
  }

  static Route _buildDashboardRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.dashboard),
    );
  }

  static Route _buildSearchRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.serarch),
    );
  }

  static Route _buildFavoriteRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.favorite),
    );
  }

  static Route _buildSettingsRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.settings),
    );
  }

  static Route _buildFavoriteDetailsRoute(
    RouteSettings settings, {
    String id,
    FavoriteAsteroidEntity asteroid,
  }) {
    var initialEvent;
    if (asteroid != null) {
      initialEvent = FavoriteAsteroidDetailsSetEvent(asteroid);
    } else {
      int idInt = int.parse(id);
      initialEvent = FavoriteAsteroidDetailsGetByIdEvent(idInt);
    }
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
          create: (BuildContext context) =>
              getIt<FavoriteAsteroidDetailsBloc>()..add(initialEvent),
          child: FavoriteAsteroidDetailsPage()),
    );
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return NotFoundPage();
      },
    );
  }
}
