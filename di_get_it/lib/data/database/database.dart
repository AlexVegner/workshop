import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class NasaAsteroids extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get timestamp => integer().nullable()();
  RealColumn get distance => real().nullable()();
  TextColumn get detailsUrl => text().withLength(min: 1, max: 200)();
  TextColumn get date => text().withLength(min: 1, max: 20)();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [NasaAsteroids])
class NasaAsteroidsDao extends DatabaseAccessor<AppDatabase>
    with _$NasaAsteroidsDaoMixin {
  NasaAsteroidsDao(AppDatabase db) : super(db);

  Future<List<NasaAsteroid>> getAllAsteroids() => select(nasaAsteroids).get();
  
  Future<List<NasaAsteroid>> getAllAsteroidsByDate(String date) =>
      (select(nasaAsteroids)..where((t) => t.date.equals(date))).get();

  Stream<List<NasaAsteroid>> watchAllAsteroids() => select(nasaAsteroids).watch();

  Future insertAsteroid(NasaAsteroid asteroid) =>
      into(nasaAsteroids).insert(asteroid, orReplace: true);

  Future insertAllAsteroids(List<NasaAsteroid> asteroidList) =>
      batch((barch) => [
        ...asteroidList.map<Future<int>>((asteroid) => into(nasaAsteroids).insert(asteroid, orReplace: true))
      ]);
  
  Future updateAsteroid(NasaAsteroid asteroid) =>
      update(nasaAsteroids).replace(asteroid);

  Future deleteAsteroid(NasaAsteroid asteroid) =>
      delete(nasaAsteroids).delete(asteroid);
}

class FavoriteAsteroids extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get timestamp => integer().nullable()();
  RealColumn get distance => real().nullable()();
  TextColumn get detailsUrl => text().withLength(min: 1, max: 200)();
  TextColumn get note => text().withLength(min: 1, max: 20)();
  IntColumn get alertLevel => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [FavoriteAsteroids])
class FavoriteAsteroidsDao extends DatabaseAccessor<AppDatabase>
    with _$FavoriteAsteroidsDaoMixin {
  FavoriteAsteroidsDao(AppDatabase db) : super(db);

  Future<List<FavoriteAsteroid>> getAllAsteroids() => select(favoriteAsteroids).get();

  Future<FavoriteAsteroid> getAsteroidById(int id) => (select(favoriteAsteroids)..where((t) => t.id.equals(id))).getSingle();
  
  Stream<List<FavoriteAsteroid>> watchAllAsteroids() => select(favoriteAsteroids).watch();

  Future insertAsteroid(FavoriteAsteroid asteroid) =>
      into(favoriteAsteroids).insert(asteroid, orReplace: true);

  Future insertAllAsteroids(List<FavoriteAsteroid> asteroidList) =>
      batch((barch) => [
        ...asteroidList.map<Future<int>>((asteroid) => into(favoriteAsteroids).insert(asteroid, orReplace: true))
      ]);
  
  Future updateAsteroid(FavoriteAsteroid asteroid) =>
      update(favoriteAsteroids).replace(asteroid);

  Future deleteAsteroid(FavoriteAsteroid asteroid) =>
      delete(favoriteAsteroids).delete(asteroid);
}

@lazySingleton
@injectable
@UseMoor(tables: [NasaAsteroids, FavoriteAsteroids], daos: [NasaAsteroidsDao, FavoriteAsteroidsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 7;
}
