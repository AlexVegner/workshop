import 'package:injectable/injectable.dart';
import 'package:storage/data/favorite_asteroid/models/favorite_asteroid.dart';

import 'favorite_asteroid_local_datasource_moor_impl.dart';

@Bind.toType(FavoriteAsteroidLocalDatasourceMoorImpl)
@injectable
abstract class FavoriteAsteroidLocalDatasource {
  Future<List<FavoriteAsteroid>> getAll();
  Future<FavoriteAsteroid> getById(int id);
  Future<void> create(FavoriteAsteroid asteroid);
  Future<void> update(FavoriteAsteroid asteroid);
  Future<void> delete(FavoriteAsteroid asteroid);
}

