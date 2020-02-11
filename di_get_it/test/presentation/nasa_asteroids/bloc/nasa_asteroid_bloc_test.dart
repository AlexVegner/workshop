import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'package:storage/domain/nasa_asteroid/usecases/nasa_asteroid_usecases.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';
import 'package:storage/presentation/nasa_asteroids/bloc/nasa_asteroid_bloc.dart';

class MockGetNasaAsteroidUsecase extends Mock
    implements GetNasaAsteroidUsecase {}

main() {
  MockGetNasaAsteroidUsecase mockGetNasaAsteroidUsecase;

  setUp(() {
    mockGetNasaAsteroidUsecase = MockGetNasaAsteroidUsecase();
  });
  final asteroidDate = '2019-12-06';
  final nasaAsteroidEntity = NasaAsteroidEntity(
      id: 3893729,
      name: "(2019 WB5)",
      timestamp: 1575601320000,
      distance: 7153178.304306706,
      detailsUrl: "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893729");

  group('NasaAsteroidBloc', () {
    blocTest(
        'should emit [NasaAsteroidInitialState, NasaAsteroidLoadingState, NasaAsteroidDataState]',
        build: () {
          when(mockGetNasaAsteroidUsecase.call(any))
              .thenAnswer((_) async => [nasaAsteroidEntity]);
          return NasaAsteroidBloc(
              getNasaAsteroidUsecase: mockGetNasaAsteroidUsecase);
        },
        act: (bloc) => bloc.add(NasaAsteroidLoadByDateEvent(asteroidDate)),
        expect: [
          const NasaAsteroidInitialState(),
          NasaAsteroidLoadingState(date: asteroidDate),
          NasaAsteroidDataState(nasaAsteroidList: [nasaAsteroidEntity])
        ]);

    blocTest(
        'should emit [NasaAsteroidInitialState, NasaAsteroidLoadingState, NasaAsteroidErrorState]',
        build: () {
          when(mockGetNasaAsteroidUsecase.call(any)).thenThrow('network error');
          return NasaAsteroidBloc(
              getNasaAsteroidUsecase: mockGetNasaAsteroidUsecase);
        },
        act: (bloc) => bloc.add(NasaAsteroidLoadByDateEvent(asteroidDate)),
        expect: [
          const NasaAsteroidInitialState(),
          NasaAsteroidLoadingState(date: asteroidDate),
          NasaAsteroidErrorState('network error')
        ]);
  });
}
