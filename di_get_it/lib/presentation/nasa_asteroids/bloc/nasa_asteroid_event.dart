part of 'nasa_asteroid_bloc.dart';

@immutable
abstract class NasaAsteroidEvent {}

@immutable
class NasaAsteroidLoadTodayEvent extends NasaAsteroidEvent {
}

@immutable
class NasaAsteroidLoadByDateEvent extends NasaAsteroidEvent {
  final String date;

  NasaAsteroidLoadByDateEvent(this.date);
}

