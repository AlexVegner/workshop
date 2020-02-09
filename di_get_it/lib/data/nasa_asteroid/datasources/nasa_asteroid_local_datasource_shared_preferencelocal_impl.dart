import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';

import 'nasa_asteroid_local_datasource.dart';

class NasaAsteroidLocalDatasourceSharedPrefetenceImpl
    implements NasaAsteroidLocalDatasource {
  final SharedPreferences sharedPreferences;

  NasaAsteroidLocalDatasourceSharedPrefetenceImpl(
      {@required this.sharedPreferences});

  @override
  Future<List<NasaAsteroid>> getAsteroidsByDate(String date) async {
    final jsonString = sharedPreferences.getString('asteroid_cache_$date');
    if (jsonString != null) {
      List<dynamic> rawList = jsonDecode(jsonString);
      List<NasaAsteroid> asteroidList = rawList
          .map<NasaAsteroid>((dynamic rawItem) =>
              NasaAsteroid.fromJson(rawItem as Map<String, dynamic>))
          .toList();
          // .cast<Asteroid>();
      return asteroidList;
    }
    return null;
  }

  @override
  Future<void> setAsteroidsByDate(String date, List<NasaAsteroid> asteroids) async {
    if (asteroids == null) {
      await sharedPreferences.remove('asteroid_cache_$date');
    } else {
      final rawList = asteroids
          .map<Map<String, dynamic>>((NasaAsteroid asteroid) => asteroid.toJson())
          .toList();
          //.cast<Map<String, dynamic>>();
      final json = jsonEncode(rawList);
      await sharedPreferences.setString('asteroid_cache_$date', json);
    }
  }
}
