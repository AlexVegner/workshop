import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/common/errors/no_connection_error.dart';
import 'package:storage/common/network/network_check.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';
import 'package:storage/domain/nasa_asteroid/repository/nasa_asteroid_repository.dart';

@lazySingleton
@injectable
class NasaAsteroidRepositoryImpl
    implements NasaAsteroidRepository {
  final NasaAsteroidLocalDatasource nasaAsteroidLocalDatasource;
  final NasaAsteroidRemoteDatasource nasaAsteroidNetworkDatasource;
  final NetworkCheck networkCheck;

  NasaAsteroidRepositoryImpl({
    @required this.nasaAsteroidLocalDatasource,
    @required this.nasaAsteroidNetworkDatasource,
    @required this.networkCheck,
  });

  @override
  Future<List<NasaAsteroidEntity>> getAsteroidsByDate(String date) async {
    final localData = await nasaAsteroidLocalDatasource.getAsteroidsByDate(date);
    if (localData != null && localData.isNotEmpty) {
      return localData;
    } if (await networkCheck.isOnline()) {
      final asteroidList = await nasaAsteroidNetworkDatasource.getAsteroidsByDate(date);
      nasaAsteroidLocalDatasource.setAsteroidsByDate(date, asteroidList);
      return asteroidList;
    }
    // return [];
    throw NoConnectionError();
  }
}

//final sharedPreferences = await SharedPreferences.getInstance();