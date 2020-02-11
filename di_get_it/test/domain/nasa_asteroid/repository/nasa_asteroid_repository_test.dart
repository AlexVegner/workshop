import 'package:flutter_test/flutter_test.dart';
//import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:storage/common/network/network_check.dart';

import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';
import 'package:storage/data/nasa_asteroid/repositories/nasa_asteroid_repository.dart';

class MockNasaAsteroidLocalDatasource extends Mock
    implements NasaAsteroidLocalDatasource {}

class MockNasaAsteroidRemoteDatasource extends Mock
    implements NasaAsteroidRemoteDatasource {}

class MockNetworkCheck extends Mock implements NetworkCheck {}

void main() {
  NasaAsteroidRepositoryImpl repository;
  MockNasaAsteroidRemoteDatasource mockRemoteDataSource;
  MockNasaAsteroidLocalDatasource mockLocalDataSource;
  MockNetworkCheck mockNetworkCheck;

  setUp(() {
    mockRemoteDataSource = MockNasaAsteroidRemoteDatasource();
    mockLocalDataSource = MockNasaAsteroidLocalDatasource();
    mockNetworkCheck = MockNetworkCheck();
    repository = NasaAsteroidRepositoryImpl(
      nasaAsteroidNetworkDatasource: mockRemoteDataSource,
      nasaAsteroidLocalDatasource: mockLocalDataSource,
      networkCheck: mockNetworkCheck,
    );
  });

  final asteroidDate = '2019-12-06';
  final nasaAsteroidModel = NasaAsteroid(
      id: 3893729,
      name: "(2019 WB5)",
      timestamp: 1575601320000,
      distance: 7153178.304306706,
      detailsUrl: "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893729");

  test('should return cached asteroids from local DB', () async {
    when(mockLocalDataSource.getAsteroidsByDate(any))
        .thenAnswer((_) async => [nasaAsteroidModel]);

    final result = await repository.getAsteroidsByDate(asteroidDate);

    verify(mockLocalDataSource.getAsteroidsByDate(asteroidDate));
    expect(result, [nasaAsteroidModel]);
  });

  group('online', () {
    setUp(() {
      when(mockNetworkCheck.isOnline()).thenAnswer((_) async => true);
    });

    test(
        'should return data from remote data source in case cache is empty or outdated',
        () async {
      when(mockLocalDataSource.getAsteroidsByDate(any))
          .thenAnswer((_) async => []);
      when(mockRemoteDataSource.getAsteroidsByDate(any))
          .thenAnswer((_) async => [nasaAsteroidModel]);

      final result = await repository.getAsteroidsByDate(asteroidDate);

      verify(mockLocalDataSource.getAsteroidsByDate(asteroidDate));
      verify(mockRemoteDataSource.getAsteroidsByDate(asteroidDate));
      verify(mockLocalDataSource
          .setAsteroidsByDate(asteroidDate, [nasaAsteroidModel]));

      expect(result, [nasaAsteroidModel]);
    });
  });
}
