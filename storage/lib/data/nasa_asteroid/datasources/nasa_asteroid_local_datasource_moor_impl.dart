import 'package:flutter/material.dart';
import 'package:storage/data/database.dart' as db;
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/models/asteroid.dart';

class NasaAsteroidLocalDatasourceMoorImpl
    implements NasaAsteroidLocalDatasource {
  final db.AppDatabase database;

  NasaAsteroidLocalDatasourceMoorImpl({@required this.database});

  @override
  Future<List<Asteroid>> getAsteroidsByDate(String date) async {
    final List<db.Asteroid> asteroidDbList =
        await database.asteroidsDao.getAllAsteroidsByDate(date);
    final List<Asteroid> asteroidList = asteroidDbList
        .map<Asteroid>((db.Asteroid dbAsteroid) {
          return Asteroid(
            id: dbAsteroid.id,
            name: dbAsteroid.name,
            distance: dbAsteroid.distance,
            timestamp: dbAsteroid.timestamp,
            detailsUrl: dbAsteroid.detailsUrl,
          );
        })
        .toList();
        //.cast<Asteroid>();
    return asteroidList;
  }

  @override
  Future<void> setAsteroidsByDate(
      String date, List<Asteroid> asteroids) async {
    final List<db.Asteroid> asteroidDbList = asteroids
        .map<db.Asteroid>((Asteroid asteroid) {
          return db.Asteroid(
            id: asteroid.id,
            name: asteroid.name,
            distance: asteroid.distance,
            timestamp: asteroid.timestamp,
            detailsUrl: asteroid.detailsUrl,
            date: date,
          );
        })
        .toList();
        //.cast<db.Asteroid>();
    await database.asteroidsDao.insertAllAsteroids(asteroidDbList);
  }
}
