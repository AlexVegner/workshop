import 'package:injectable/injectable.dart';
import 'package:storage/common/models/use_case.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';
import 'package:storage/domain/nasa_asteroid/repository/nasa_asteroid_repository.dart';
import 'package:meta/meta.dart';

@lazySingleton
@injectable
class GetNasaAsteroidUsecase implements UseCase<List<NasaAsteroidEntity>, String> {
  final NasaAsteroidRepository nasaAsteroidRepository;

  GetNasaAsteroidUsecase({@required this.nasaAsteroidRepository});

  @override
  Future<List<NasaAsteroidEntity>> call(String payload) {
    return nasaAsteroidRepository.getAsteroidsByDate(payload);
  }
}