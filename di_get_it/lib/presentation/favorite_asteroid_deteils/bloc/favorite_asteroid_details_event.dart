part of 'favorite_asteroid_details_bloc.dart';

@immutable
abstract class FavoriteAsteroidDetailsEvent {}

@immutable
class FavoriteAsteroidDetailsSaveEvent extends FavoriteAsteroidDetailsEvent {
  final FavoriteAsteroidEntity favoriteAsteroidEntity;

  FavoriteAsteroidDetailsSaveEvent(this.favoriteAsteroidEntity);
}

@immutable
class FavoriteAsteroidDetailsSetEvent extends FavoriteAsteroidDetailsEvent {
  final FavoriteAsteroidEntity favoriteAsteroidEntity;

  FavoriteAsteroidDetailsSetEvent(this.favoriteAsteroidEntity);
}

@immutable
class FavoriteAsteroidDetailsGetByIdEvent extends FavoriteAsteroidDetailsEvent {
  final int id;

  FavoriteAsteroidDetailsGetByIdEvent(this.id);
}