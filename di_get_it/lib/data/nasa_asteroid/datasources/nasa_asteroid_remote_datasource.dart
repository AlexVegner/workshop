import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:storage/common/network/nasa_ws_client.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';

@Bind.toType(NasaAsteroidRemoteDatasourceImpl)
@injectable
abstract class NasaAsteroidRemoteDatasource {
  Future<List<NasaAsteroid>> getAsteroidsByDate(String date);
}

@lazySingleton
@injectable
class NasaAsteroidRemoteDatasourceImpl implements NasaAsteroidRemoteDatasource {
  final NasaWsClient client;

  NasaAsteroidRemoteDatasourceImpl({@required this.client});

  factory NasaAsteroidRemoteDatasourceImpl.create() {
    return NasaAsteroidRemoteDatasourceImpl(
      client: NasaWsClientImpl(http.Client()),
    );
  }

  @override
  Future<List<NasaAsteroid>> getAsteroidsByDate(String date) async {
    final startDate = date;
    final endDate = date;
    Uri uri = Uri.https('api.nasa.gov', 'neo/rest/v1/feed', {
      'start_date': startDate,
      'end_date': endDate,
      'api_key': 'DEMO_KEY',
    });
    final response = await client.get(uri);
    String json = response.body;
    List<NasaAsteroid> asteroids = [];
    Map<String, dynamic> decodedJson = jsonDecode(json);
    Map<String, dynamic> datesDecoded = decodedJson['near_earth_objects'];
    datesDecoded.forEach((key, value) {
      value.forEach((listItem) {
        asteroids.add(NasaAsteroid.fromNeoJson(listItem as Map<String, dynamic>));
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
