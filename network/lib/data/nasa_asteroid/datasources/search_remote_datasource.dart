import 'dart:convert';
import 'package:network/common/network/nasa_ws_client.dart';
import 'package:network/data/nasa_asteroid/models/asteroid.dart';
import 'package:meta/meta.dart';

import 'fake_response.dart';
import 'package:http/http.dart' as http;

abstract class NasaAsteroidRemoteDatasource {
  Future<List<Asteroid>> getAsteroidsNearEarch();
}

class NasaAsteroidRemoteDatasourceImpl implements NasaAsteroidRemoteDatasource {
  final NasaWsClient client;

  NasaAsteroidRemoteDatasourceImpl({@required this.client});

  factory NasaAsteroidRemoteDatasourceImpl.create() {
    return NasaAsteroidRemoteDatasourceImpl(
      client: NasaWsClientImpl(http.Client()),
    );
  }

  @override
  Future<List<Asteroid>> getAsteroidsNearEarch(
      {String startDate = '2019-12-05', String endDate = '2019-12-06'}) async {
    Uri uri = Uri.https('api.nasa.gov', 'neo/rest/v1/feed', {
      'start_date': startDate,
      'end_date': endDate,
      'api_key': 'DEMO_KEY',
    });
    final response = await client.get(uri);
    String json = response.body;
    List<Asteroid> asteroids = [];
    Map<String, dynamic> decodedJson = jsonDecode(json);
    Map<String, dynamic> datesDecoded = decodedJson['near_earth_objects'];
    datesDecoded.forEach((key, value) {
      value.forEach((listItem) {
        asteroids.add(Asteroid.fromNeoJson(listItem as Map<String, dynamic>));
      });
    });
    return asteroids;
  }
}

class NasaAsteroidRemoteDatasourceMock implements NasaAsteroidRemoteDatasource {
  @override
  Future<List<Asteroid>> getAsteroidsNearEarch() async {
    String json = getFakeAsteroidResponse();
    List<Asteroid> asteroids = [];
    Map<String, dynamic> decodedJson = jsonDecode(json);
    Map<String, dynamic> datesDecoded = decodedJson['near_earth_objects'];
    datesDecoded.forEach((key, value) {
      value.forEach((listItem) {
        asteroids.add(Asteroid.fromJson(listItem as Map<String, dynamic>));
      });
    });
    return asteroids;
  }
}
