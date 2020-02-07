import 'package:storage/data/nasa_asteroid/models/asteroid.dart';

abstract class NasaAsteroidLocalDatasource {
  Future<List<Asteroid>> getAsteroidsByDate(String date);
  Future<void> setAsteroidsByDate(String date, List<Asteroid> asteroids);
}

