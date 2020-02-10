import 'package:injectable/injectable.dart';
import 'package:storage/data/favorite_asteroid/repositories/favorite_asteroid_repository.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';

@Bind.toType(FavoriteAsteroidRepositoryImpl)
@injectable
abstract class FavoriteAsteroidRepository {
  Future<List<FavoriteAsteroidEntity>> getAllAsteroids();
  Future<FavoriteAsteroidEntity> getAsteroidById(int id);
  Future<void> createAsteroid(FavoriteAsteroidEntity asteroid);
  Future<void> updateAsteroid(FavoriteAsteroidEntity asteroid);
  Future<void> deleteAsteroid(FavoriteAsteroidEntity asteroid);
}