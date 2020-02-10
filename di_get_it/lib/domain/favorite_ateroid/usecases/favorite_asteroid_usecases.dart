import 'package:injectable/injectable.dart';
import 'package:storage/common/models/use_case.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';
import 'package:storage/domain/favorite_ateroid/repository/favorite_asteroid_repository.dart';
import 'package:meta/meta.dart';

@lazySingleton
@injectable
class GetAllFavoriteAsteroidsUsecase implements UseCase<List<FavoriteAsteroidEntity>, NoPayload> {
  final FavoriteAsteroidRepository favoriteAsteroidRepository;

  GetAllFavoriteAsteroidsUsecase({@required this.favoriteAsteroidRepository});

  @override
  Future<List<FavoriteAsteroidEntity>> call(NoPayload _) {
    return favoriteAsteroidRepository.getAllAsteroids();
  }
}

@lazySingleton
@injectable
class GetFavoriteAsteroidByIdUsecase implements UseCase<FavoriteAsteroidEntity, int> {
  final FavoriteAsteroidRepository favoriteAsteroidRepository;

  GetFavoriteAsteroidByIdUsecase({@required this.favoriteAsteroidRepository});

  @override
  Future<FavoriteAsteroidEntity> call(int id) {
    return favoriteAsteroidRepository.getAsteroidById(id);
  }
}

@lazySingleton
@injectable
class CreateFavoriteAsteroidUsecase implements UseCase<void, NoPayload> {
final FavoriteAsteroidRepository favoriteAsteroidRepository;

  CreateFavoriteAsteroidUsecase({@required this.favoriteAsteroidRepository});

  @override
  Future<void> call(NoPayload _) {
    return favoriteAsteroidRepository.getAllAsteroids();
  }
}

@lazySingleton
@injectable
class UpdateFavoriteAsteroidUsecase implements UseCase<void, FavoriteAsteroidEntity> {
  final FavoriteAsteroidRepository favoriteAsteroidRepository;

  UpdateFavoriteAsteroidUsecase({@required this.favoriteAsteroidRepository});

  @override
  Future<void> call(FavoriteAsteroidEntity asteroid) {
    return favoriteAsteroidRepository.getAllAsteroids();
  }
}

@lazySingleton
@injectable
class DeleteFavoriteAsteroidUsecase implements UseCase<void, FavoriteAsteroidEntity> {
  final FavoriteAsteroidRepository favoriteAsteroidRepository;

  DeleteFavoriteAsteroidUsecase({@required this.favoriteAsteroidRepository});

  @override
  Future<void> call(FavoriteAsteroidEntity asteroid) {
    return favoriteAsteroidRepository.getAllAsteroids();
  }
}