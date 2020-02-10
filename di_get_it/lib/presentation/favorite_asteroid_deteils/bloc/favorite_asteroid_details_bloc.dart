import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';
import 'package:storage/domain/favorite_ateroid/usecases/favorite_asteroid_usecases.dart';

part 'favorite_asteroid_details_event.dart';
part 'favorite_asteroid_details_state.dart';

@injectable
class FavoriteAsteroidDetailsBloc
    extends Bloc<FavoriteAsteroidDetailsEvent, FavoriteAsteroidDetailsState> {
  final GetFavoriteAsteroidByIdUsecase getFavoriteAsteroidByIdUsecase;
  final UpdateFavoriteAsteroidUsecase updateFavoriteAsteroidUsecase;

  FavoriteAsteroidDetailsBloc({
    this.getFavoriteAsteroidByIdUsecase,
    this.updateFavoriteAsteroidUsecase,
  });

  @override
  FavoriteAsteroidDetailsState get initialState =>
      FavoriteAsteroidDetailsInitialState();

  @override
  Stream<FavoriteAsteroidDetailsState> mapEventToState(
    FavoriteAsteroidDetailsEvent event,
  ) async* {
    if (event is FavoriteAsteroidDetailsGetByIdEvent) {
      yield FavoriteAsteroidDetailLoadingState();
      try {
        final asteroid =
            await getFavoriteAsteroidByIdUsecase(event.id);
        yield FavoriteAsteroidDetailEditState(asteroid);
      } catch (e) {
        yield FavoriteAsteroidDetailErrorState(e);
      }
    } else if (event is FavoriteAsteroidDetailsSetEvent) {
      yield FavoriteAsteroidDetailEditState(event.favoriteAsteroidEntity);
    } else if (event is FavoriteAsteroidDetailsSaveEvent) {
      yield FavoriteAsteroidDetailLoadingState();
      try {
        await updateFavoriteAsteroidUsecase(event.favoriteAsteroidEntity);
        yield FavoriteAsteroidDetailSavedState();
      } catch (e) {
        yield FavoriteAsteroidDetailErrorState(e);
      }
    }
  }
}
