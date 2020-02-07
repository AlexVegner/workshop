import 'dart:convert';
import 'package:storage/common/network/nasa_ws_client.dart';
import 'package:storage/data/nasa_asteroid/models/asteroid.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

abstract class NasaAsteroidRemoteDatasource {
  Future<List<Asteroid>> getAsteroidsByDate(String date);
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
  Future<List<Asteroid>> getAsteroidsByDate(String date) async {
    final startDate = date;
    final endDate = date;
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

// class NasaAsteroidRemoteDatasourceMock implements NasaAsteroidRemoteDatasource {
//   @override
//   Future<List<Asteroid>> getAsteroidsNearEarch() async {
//     String json = getFakeAsteroidResponse();
//     List<Asteroid> asteroids = [];
//     Map<String, dynamic> decodedJson = jsonDecode(json);
//     Map<String, dynamic> datesDecoded = decodedJson['near_earth_objects'];
//     datesDecoded.forEach((key, value) {
//       value.forEach((listItem) {
//         asteroids.add(Asteroid.fromJson(listItem as Map<String, dynamic>));
//       });
//     });
//     return asteroids;
//   }
// }
