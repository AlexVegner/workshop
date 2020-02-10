import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/data/database/database.dart' as db;
import 'package:storage/data/favorite_asteroid/models/favorite_asteroid.dart';

import 'favorite_asteroid_local_datasource.dart';

@lazySingleton
@injectable
class FavoriteAsteroidLocalDatasourceMoorImpl
    implements FavoriteAsteroidLocalDatasource {
  final db.AppDatabase database;

  FavoriteAsteroidLocalDatasourceMoorImpl({@required this.database});

  @override
  Future<void> create(FavoriteAsteroid asteroid) async {
    await database.favoriteAsteroidsDao.insertAsteroid(db.FavoriteAsteroid(
      id: asteroid.id,
      name: asteroid.name,
      timestamp: asteroid.timestamp,
      distance: asteroid.distance,
      detailsUrl: asteroid.detailsUrl,
      note: asteroid.note,
      alertLevel: asteroid.alertLevel,
    ));
  }

  @override
  Future<void> delete(FavoriteAsteroid asteroid) async {
    await database.favoriteAsteroidsDao.deleteAsteroid(db.FavoriteAsteroid(
      id: asteroid.id,
      name: asteroid.name,
      timestamp: asteroid.timestamp,
      distance: asteroid.distance,
      detailsUrl: asteroid.detailsUrl,
      note: asteroid.note,
      alertLevel: asteroid.alertLevel,
    ));
  }

  @override
  Future<List<FavoriteAsteroid>> getAll() async {
    final asteroidDbList =
        await database.favoriteAsteroidsDao.getAllAsteroids();
    final List<FavoriteAsteroid> asteroidList =
        asteroidDbList.map<FavoriteAsteroid>((db.FavoriteAsteroid dbAsteroid) {
      return FavoriteAsteroid(
        id: dbAsteroid.id,
        name: dbAsteroid.name,
        distance: dbAsteroid.distance,
        timestamp: dbAsteroid.timestamp,
        detailsUrl: dbAsteroid.detailsUrl,
        note: dbAsteroid.note,
        alertLevel: dbAsteroid.alertLevel,
      );
    }).toList();
    return asteroidList;
  }

  @override
  Future<FavoriteAsteroid> getById(int id) async {
    final asteroidDb = await database.favoriteAsteroidsDao.getAsteroidById(id);
    final FavoriteAsteroid favoriteAsteroid = FavoriteAsteroid(
      id: asteroidDb.id,
      name: asteroidDb.name,
      distance: asteroidDb.distance,
      timestamp: asteroidDb.timestamp,
      detailsUrl: asteroidDb.detailsUrl,
      note: asteroidDb.note,
      alertLevel: asteroidDb.alertLevel,
    );
    return favoriteAsteroid;
  }

  @override
  Future<void> update(FavoriteAsteroid asteroid) async {
    await database.favoriteAsteroidsDao.updateAsteroid(db.FavoriteAsteroid(
      id: asteroid.id,
      name: asteroid.name,
      timestamp: asteroid.timestamp,
      distance: asteroid.distance,
      detailsUrl: asteroid.detailsUrl,
      note: asteroid.note,
      alertLevel: asteroid.alertLevel,
    ));
  }
}
