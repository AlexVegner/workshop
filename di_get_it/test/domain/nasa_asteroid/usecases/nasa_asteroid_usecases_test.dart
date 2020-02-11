import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:storage/domain/nasa_asteroid/usecases/nasa_asteroid_usecases.dart';
import 'package:storage/domain/nasa_asteroid/repository/nasa_asteroid_repository.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';

class MockNasaAsteroidRepository extends Mock
    implements NasaAsteroidRepository {}

void main() {
  GetNasaAsteroidUsecase usecase;
  MockNasaAsteroidRepository mockNasaAsteroidRepository;

  setUp(() {
    mockNasaAsteroidRepository = MockNasaAsteroidRepository();
    usecase = GetNasaAsteroidUsecase(
        nasaAsteroidRepository: mockNasaAsteroidRepository);
  });

  final nasaAsteroidEntity = NasaAsteroidEntity(
      detailsUrl: '', id: 0, name: '', distance: 0.0, timestamp: 0);

  test('Should provide nasa asteroid from repository without mutation',
      () async {
    when(mockNasaAsteroidRepository.getAsteroidsByDate(any))
        .thenAnswer((_) async {
      return [];
    });

    final result = await usecase.call('date');

    verify(mockNasaAsteroidRepository.getAsteroidsByDate('date'));
    verifyNoMoreInteractions(mockNasaAsteroidRepository);

    expect(result, []);
  });

  test('Should provide nasa asteroid from repository without mutation',
      () async {
    when(mockNasaAsteroidRepository.getAsteroidsByDate(any))
        .thenAnswer((_) async {
      return [nasaAsteroidEntity];
    });

    final result = await usecase('date');

    verify(mockNasaAsteroidRepository.getAsteroidsByDate('date'));
    verifyNoMoreInteractions(mockNasaAsteroidRepository);

    expect(result, [nasaAsteroidEntity]);
  });
}
