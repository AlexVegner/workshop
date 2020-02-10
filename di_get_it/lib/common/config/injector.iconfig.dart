// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:storage/common/network/nasa_ws_client.dart';
import 'package:http/src/client.dart';
import 'package:storage/common/network/network_check.dart';
import 'package:connectivity/connectivity.dart';
import 'package:storage/data/database/database.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource_moor_impl.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource.dart';
import 'package:storage/data/nasa_asteroid/repositories/nasa_asteroid_repository.dart';
import 'package:storage/data/favorite_asteroid/datasources/favorite_asteroid_local_datasource.dart';
import 'package:storage/data/favorite_asteroid/datasources/favorite_asteroid_local_datasource_moor_impl.dart';
import 'package:storage/data/favorite_asteroid/repositories/favorite_asteroid_repository.dart';
import 'package:storage/domain/nasa_asteroid/repository/nasa_asteroid_repository.dart';
import 'package:storage/domain/nasa_asteroid/usecases/nasa_asteroid_usecases.dart';
import 'package:storage/domain/favorite_ateroid/repository/favorite_asteroid_repository.dart';
import 'package:storage/domain/favorite_ateroid/usecases/favorite_asteroid_usecases.dart';
import 'package:storage/presentation/favorite_asteroid_deteils/bloc/favorite_asteroid_details_bloc.dart';
import 'package:storage/presentation/favorite_asteroid_list/bloc/favorite_asteroid_list_bloc.dart';
import 'package:storage/presentation/nasa_asteroids/bloc/nasa_asteroid_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<NasaWsClient>(() => NasaWsClientImpl(getIt<Client>()))
    ..registerLazySingleton<NasaWsClientImpl>(
        () => NasaWsClientImpl(getIt<Client>()))
    ..registerFactory<NetworkCheck>(
        () => NetworkCheckImpl(connectivity: getIt<Connectivity>()))
    ..registerLazySingleton<NetworkCheckImpl>(
        () => NetworkCheckImpl(connectivity: getIt<Connectivity>()))
    ..registerLazySingleton<AppDatabase>(() => AppDatabase())
    ..registerFactory<NasaAsteroidRemoteDatasource>(
        () => NasaAsteroidRemoteDatasourceImpl(client: getIt<NasaWsClient>()))
    ..registerLazySingleton<NasaAsteroidRemoteDatasourceImpl>(
        () => NasaAsteroidRemoteDatasourceImpl(client: getIt<NasaWsClient>()))
    ..registerLazySingleton<NasaAsteroidLocalDatasourceMoorImpl>(() =>
        NasaAsteroidLocalDatasourceMoorImpl(database: getIt<AppDatabase>()))
    ..registerFactory<NasaAsteroidLocalDatasource>(() =>
        NasaAsteroidLocalDatasourceMoorImpl(database: getIt<AppDatabase>()))
    ..registerLazySingleton<NasaAsteroidRepositoryImpl>(() =>
        NasaAsteroidRepositoryImpl(
          nasaAsteroidLocalDatasource: getIt<NasaAsteroidLocalDatasource>(),
          nasaAsteroidNetworkDatasource: getIt<NasaAsteroidRemoteDatasource>(),
          networkCheck: getIt<NetworkCheck>(),
        ))
    ..registerFactory<FavoriteAsteroidLocalDatasource>(() =>
        FavoriteAsteroidLocalDatasourceMoorImpl(database: getIt<AppDatabase>()))
    ..registerLazySingleton<FavoriteAsteroidLocalDatasourceMoorImpl>(() =>
        FavoriteAsteroidLocalDatasourceMoorImpl(database: getIt<AppDatabase>()))
    ..registerLazySingleton<FavoriteAsteroidRepositoryImpl>(() => FavoriteAsteroidRepositoryImpl(favoriteAsteroidLocalDatasource: getIt<FavoriteAsteroidLocalDatasource>()))
    ..registerFactory<NasaAsteroidRepository>(() => NasaAsteroidRepositoryImpl(
          nasaAsteroidLocalDatasource: getIt<NasaAsteroidLocalDatasource>(),
          nasaAsteroidNetworkDatasource: getIt<NasaAsteroidRemoteDatasource>(),
          networkCheck: getIt<NetworkCheck>(),
        ))
    ..registerLazySingleton<GetNasaAsteroidUsecase>(() => GetNasaAsteroidUsecase(nasaAsteroidRepository: getIt<NasaAsteroidRepository>()))
    ..registerFactory<FavoriteAsteroidRepository>(() => FavoriteAsteroidRepositoryImpl(favoriteAsteroidLocalDatasource: getIt<FavoriteAsteroidLocalDatasource>()))
    ..registerLazySingleton<GetAllFavoriteAsteroidsUsecase>(() => GetAllFavoriteAsteroidsUsecase(favoriteAsteroidRepository: getIt<FavoriteAsteroidRepository>()))
    ..registerLazySingleton<GetFavoriteAsteroidByIdUsecase>(() => GetFavoriteAsteroidByIdUsecase(favoriteAsteroidRepository: getIt<FavoriteAsteroidRepository>()))
    ..registerLazySingleton<CreateFavoriteAsteroidUsecase>(() => CreateFavoriteAsteroidUsecase(favoriteAsteroidRepository: getIt<FavoriteAsteroidRepository>()))
    ..registerLazySingleton<UpdateFavoriteAsteroidUsecase>(() => UpdateFavoriteAsteroidUsecase(favoriteAsteroidRepository: getIt<FavoriteAsteroidRepository>()))
    ..registerLazySingleton<DeleteFavoriteAsteroidUsecase>(() => DeleteFavoriteAsteroidUsecase(favoriteAsteroidRepository: getIt<FavoriteAsteroidRepository>()))
    ..registerFactory<FavoriteAsteroidDetailsBloc>(() => FavoriteAsteroidDetailsBloc(getFavoriteAsteroidByIdUsecase: getIt<GetFavoriteAsteroidByIdUsecase>(), updateFavoriteAsteroidUsecase: getIt<UpdateFavoriteAsteroidUsecase>()))
    ..registerFactory<FavoriteAsteroidListBloc>(() => FavoriteAsteroidListBloc(getAllFavoriteAsteroidsUsecase: getIt<GetAllFavoriteAsteroidsUsecase>(), deleteFavoriteAsteroidUsecase: getIt<DeleteFavoriteAsteroidUsecase>()))
    ..registerFactory<NasaAsteroidBloc>(() => NasaAsteroidBloc(getNasaAsteroidUsecase: getIt<GetNasaAsteroidUsecase>()));
}
