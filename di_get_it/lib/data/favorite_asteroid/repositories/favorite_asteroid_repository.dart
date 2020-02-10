import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/data/favorite_asteroid/datasources/favorite_asteroid_local_datasource.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';
import 'package:storage/domain/favorite_ateroid/repository/favorite_asteroid_repository.dart';

@lazySingleton
@injectable
class FavoriteAsteroidRepositoryImpl
    implements FavoriteAsteroidRepository {
  final FavoriteAsteroidLocalDatasource favoriteAsteroidLocalDatasource;

  FavoriteAsteroidRepositoryImpl({
    @required this.favoriteAsteroidLocalDatasource,
  });

  @override
  Future<void> createAsteroid(FavoriteAsteroidEntity asteroid) async {
    await favoriteAsteroidLocalDatasource.create(asteroid);
  }

  @override
  Future<void> deleteAsteroid(FavoriteAsteroidEntity asteroid) async {
    await favoriteAsteroidLocalDatasource.delete(asteroid);
  }

  @override
  Future<FavoriteAsteroidEntity> getAsteroidById(int id) async {
    return await favoriteAsteroidLocalDatasource.getById(id);
  }

  @override
  Future<List<FavoriteAsteroidEntity>> getAllAsteroids() async {
    return await favoriteAsteroidLocalDatasource.getAll();
  }

  @override
  Future<void> updateAsteroid(FavoriteAsteroidEntity asteroid) async {
    await favoriteAsteroidLocalDatasource.update(asteroid);
  }  
}