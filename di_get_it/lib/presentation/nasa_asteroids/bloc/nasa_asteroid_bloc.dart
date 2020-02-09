import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:storage/common/utils/date_utils.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';
import 'package:storage/domain/nasa_asteroid/usecases/nasa_asteroid_usecases.dart';

part 'nasa_asteroid_event.dart';
part 'nasa_asteroid_state.dart';

@injectable
class NasaAsteroidBloc extends Bloc<NasaAsteroidEvent, NasaAsteroidState> {
  final GetNasaAsteroidUsecase getNasaAsteroidUsecase;

  NasaAsteroidBloc({@required this.getNasaAsteroidUsecase});

  @override
  NasaAsteroidState get initialState => NasaAsteroidInitialState();

  @override
  Stream<NasaAsteroidState> mapEventToState(
    NasaAsteroidEvent event,
  ) async* {
    if (event is NasaAsteroidLoadTodayEvent) {
      final date = currentDateToString();
      yield* _loadNasaAsteroidByDate(date);
    } else if (event is NasaAsteroidLoadByDateEvent) {
      yield* _loadNasaAsteroidByDate(event.date);
    }
  }

  Stream<NasaAsteroidState> _loadNasaAsteroidByDate(String date) async* {
    yield NasaAsteroidLoadingState(date: date);
    try {
      final nasaAsteroidList = await getNasaAsteroidUsecase(date);
      yield NasaAsteroidDataState(nasaAsteroidList: nasaAsteroidList);
    } catch (e) {
      yield NasaAsteroidErrorState(e);
    }
  }
}
