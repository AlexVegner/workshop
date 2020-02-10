part of 'favorite_asteroid_list_bloc.dart';

@immutable
abstract class FavoriteAsteroidListState {}

class FavoriteAsteroidListInitialState extends FavoriteAsteroidListState {}

class FavoriteAsteroidListLoadingState extends FavoriteAsteroidListState {}

class FavoriteAsteroidListDataState extends FavoriteAsteroidListState {
  final List<FavoriteAsteroidEntity> favoriteAsteroidList;

  FavoriteAsteroidListDataState({this.favoriteAsteroidList});
}

class FavoriteAsteroidListErrorState extends FavoriteAsteroidListState {
  final dynamic error;

  FavoriteAsteroidListErrorState(this.error);
}