import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/data/database/database.dart' as db;
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';

@lazySingleton
@injectable
class NasaAsteroidLocalDatasourceMoorImpl
    implements NasaAsteroidLocalDatasource {
  final db.AppDatabase database;

  NasaAsteroidLocalDatasourceMoorImpl({@required this.database});

  @override
  Future<List<NasaAsteroid>> getAsteroidsByDate(String date) async {
    final List<db.NasaAsteroid> asteroidDbList =
        await database.nasaAsteroidsDao.getAllAsteroidsByDate(date);
    final List<NasaAsteroid> asteroidList = asteroidDbList
        .map<NasaAsteroid>((db.NasaAsteroid dbAsteroid) {
          return NasaAsteroid(
            id: dbAsteroid.id,
            name: dbAsteroid.name,
            distance: dbAsteroid.distance,
            timestamp: dbAsteroid.timestamp,
            detailsUrl: dbAsteroid.detailsUrl,
          );
        })
        .toList();
    return asteroidList;
  }

  @override
  Future<void> setAsteroidsByDate(
      String date, List<NasaAsteroid> asteroids) async {
    final List<db.NasaAsteroid> asteroidDbList = asteroids
        .map<db.NasaAsteroid>((NasaAsteroid asteroid) {
          return db.NasaAsteroid(
            id: asteroid.id,
            name: asteroid.name,
            distance: asteroid.distance,
            timestamp: asteroid.timestamp,
            detailsUrl: asteroid.detailsUrl,
            date: date,
          );
        })
        .toList();
    await database.nasaAsteroidsDao.insertAllAsteroids(asteroidDbList);
  }
}
