part of 'nasa_asteroid_bloc.dart';

@immutable
abstract class NasaAsteroidState {}

@immutable
class NasaAsteroidInitialState extends NasaAsteroidState {}


@immutable
class NasaAsteroidLoadingState extends NasaAsteroidState {
  final String date;

  NasaAsteroidLoadingState({this.date});
}

@immutable
class NasaAsteroidDataState extends NasaAsteroidState {
  final List<NasaAsteroidEntity> nasaAsteroidList;

  NasaAsteroidDataState({this.nasaAsteroidList});
}

@immutable
class NasaAsteroidErrorState extends NasaAsteroidState {
  final dynamic error;

  NasaAsteroidErrorState(this.error);
}


