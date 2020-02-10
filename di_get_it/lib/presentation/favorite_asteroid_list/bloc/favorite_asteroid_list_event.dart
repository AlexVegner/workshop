part of 'favorite_asteroid_list_bloc.dart';

@immutable
abstract class FavoriteAsteroidListEvent {}

@immutable
class FavoriteAsteroidListRefreshEvent {}

@immutable
class FavoriteAsteroidListDeleteEvent {
  final FavoriteAsteroidEntity favoriteAsteroidEntity;

  FavoriteAsteroidListDeleteEvent(this.favoriteAsteroidEntity);
}

