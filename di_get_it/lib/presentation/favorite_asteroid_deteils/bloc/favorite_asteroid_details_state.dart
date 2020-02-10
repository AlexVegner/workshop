part of 'favorite_asteroid_details_bloc.dart';

@immutable
abstract class FavoriteAsteroidDetailsState {}

class FavoriteAsteroidDetailsInitialState extends FavoriteAsteroidDetailsState {}

class FavoriteAsteroidDetailLoadingState extends FavoriteAsteroidDetailsState {}

class FavoriteAsteroidDetailEditState extends FavoriteAsteroidDetailsState {
  final FavoriteAsteroidEntity favoriteAsteroidEntity;

  FavoriteAsteroidDetailEditState(this.favoriteAsteroidEntity);
}

class FavoriteAsteroidDetailErrorState extends FavoriteAsteroidDetailsState {
  final dynamic error;

  FavoriteAsteroidDetailErrorState(this.error);
}

class FavoriteAsteroidDetailSavedState extends FavoriteAsteroidDetailsState {
}



