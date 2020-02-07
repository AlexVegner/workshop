import 'package:flutter/material.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:storage/data/nasa_asteroid/models/asteroid.dart';

abstract class NasaAsteroidRepository {
  Future<List<Asteroid>> getAsteroidsByDate(String date);
}

class NasaAsteroidRepositoryImpl
    implements NasaAsteroidRepository {
  final NasaAsteroidLocalDatasource nasaAsteroidLocalDatasource;
  final NasaAsteroidRemoteDatasource nasaAsteroidNetworkDatasource;

  NasaAsteroidRepositoryImpl({
    @required this.nasaAsteroidLocalDatasource,
    @required this.nasaAsteroidNetworkDatasource,
  });

  @override
  Future<List<Asteroid>> getAsteroidsByDate(String date) async {
    final localData = await nasaAsteroidLocalDatasource.getAsteroidsByDate(date);
    if (localData != null && localData.isNotEmpty) {
      return localData;
    } else {
      final asteroidList = await nasaAsteroidNetworkDatasource.getAsteroidsByDate(date);
      nasaAsteroidLocalDatasource.setAsteroidsByDate(date, asteroidList);
      return asteroidList;
    }
  }
}

//final sharedPreferences = await SharedPreferences.getInstance();