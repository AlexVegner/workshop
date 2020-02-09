import 'package:injectable/injectable.dart';
import 'package:storage/data/nasa_asteroid/repositories/nasa_asteroid_repository.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';

@Bind.toType(NasaAsteroidRepositoryImpl)
@injectable
abstract class NasaAsteroidRepository {
  Future<List<NasaAsteroidEntity>> getAsteroidsByDate(String date);
}