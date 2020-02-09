import 'package:injectable/injectable.dart';
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';

import 'nasa_asteroid_local_datasource_moor_impl.dart';

@Bind.toType(NasaAsteroidLocalDatasourceMoorImpl)
@injectable
abstract class NasaAsteroidLocalDatasource {
  Future<List<NasaAsteroid>> getAsteroidsByDate(String date);
  Future<void> setAsteroidsByDate(String date, List<NasaAsteroid> asteroids);
}

