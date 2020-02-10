import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:storage/common/models/use_case.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';
import 'package:storage/domain/favorite_ateroid/usecases/favorite_asteroid_usecases.dart';

part 'favorite_asteroid_list_event.dart';
part 'favorite_asteroid_list_state.dart';

@injectable
class FavoriteAsteroidListBloc
    extends Bloc<FavoriteAsteroidListEvent, FavoriteAsteroidListState> {
  final GetAllFavoriteAsteroidsUsecase getAllFavoriteAsteroidsUsecase;
  final DeleteFavoriteAsteroidUsecase deleteFavoriteAsteroidUsecase;

  FavoriteAsteroidListBloc({
    this.getAllFavoriteAsteroidsUsecase,
    this.deleteFavoriteAsteroidUsecase,
  });

  @override
  FavoriteAsteroidListState get initialState =>
      FavoriteAsteroidListInitialState();

  @override
  Stream<FavoriteAsteroidListState> mapEventToState(
    FavoriteAsteroidListEvent event,
  ) async* {
    if (event is FavoriteAsteroidListRefreshEvent) {
      yield FavoriteAsteroidListLoadingState();
      try {
        final favoriteList =
            await getAllFavoriteAsteroidsUsecase(const NoPayload());
        yield FavoriteAsteroidListDataState(favoriteAsteroidList: favoriteList);
      } catch (e) {
        yield FavoriteAsteroidListErrorState(e);
      }
    } else if (event is FavoriteAsteroidListDeleteEvent) {
      yield FavoriteAsteroidListLoadingState();
      try {
        await deleteFavoriteAsteroidUsecase(
            (event as FavoriteAsteroidListDeleteEvent).favoriteAsteroidEntity);
        final favoriteList =
            await getAllFavoriteAsteroidsUsecase(const NoPayload());
        yield FavoriteAsteroidListDataState(favoriteAsteroidList: favoriteList);
      } catch (e) {
        yield FavoriteAsteroidListErrorState(e);
      }
    }
  }
}
