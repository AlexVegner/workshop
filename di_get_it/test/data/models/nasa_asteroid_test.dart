import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';
import 'package:storage/data/nasa_asteroid/datasources/fake_response.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';

void main() {
  final nasaAsteroidModel = NasaAsteroid(
      id: 3893729,
      name: "(2019 WB5)",
      timestamp: 1575601320000,
      distance: 7153178.304306706,
      detailsUrl: "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893729");

  test('NasaAsteroid should be subclass of NasaAsteroidEntity', () {
    expect(nasaAsteroidModel, isA<NasaAsteroidEntity>());
  });

  final asteroidDateKey = '2019-12-06';
  test(
    'Should return a valid model when parsed from Json',
    () {
      Map<String, dynamic> decodedJson = jsonDecode(getFakeAsteroidResponse());
      Map<String, dynamic> datesDecoded = decodedJson['near_earth_objects'];
      final dateInfo = datesDecoded[asteroidDateKey];
      final firstObject = dateInfo[0];
      final result =
          NasaAsteroid.fromNeoJson(firstObject as Map<String, dynamic>);

      expect(result, nasaAsteroidModel);
    },
  );
}
