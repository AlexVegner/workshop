part of 'nasa_asteroid_bloc.dart';

@immutable
abstract class NasaAsteroidState {
  const NasaAsteroidState();
}

@immutable
class NasaAsteroidInitialState extends NasaAsteroidState {
  const NasaAsteroidInitialState();
}

@immutable
class NasaAsteroidLoadingState extends NasaAsteroidState with EquatableMixin {
  final String date;

  NasaAsteroidLoadingState({this.date});

  @override
  List<Object> get props => [date];
}

@immutable
class NasaAsteroidDataState extends NasaAsteroidState with EquatableMixin {
  final List<NasaAsteroidEntity> nasaAsteroidList;

  NasaAsteroidDataState({this.nasaAsteroidList});

  @override
  List<Object> get props => [nasaAsteroidList];
}

@immutable
class NasaAsteroidErrorState extends NasaAsteroidState with EquatableMixin {
  final dynamic error;

  NasaAsteroidErrorState(this.error);

  @override
  List<Object> get props => [error];
}
