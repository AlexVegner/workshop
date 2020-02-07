import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Asteroids extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get timestamp => integer().nullable()();
  RealColumn get distance => real().nullable()();
  TextColumn get detailsUrl => text().withLength(min: 1, max: 200)();
  TextColumn get date => text().withLength(min: 1, max: 20)();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Asteroids])
class AsteroidsDao extends DatabaseAccessor<AppDatabase> with _$AsteroidsDaoMixin {
  AsteroidsDao(AppDatabase db) : super(db);

  Future<List<Asteroid>> getAllAsteroids() => select(asteroids).get();
  Future<List<Asteroid>> getAllAsteroidsByDate(String date) => (select(asteroids)..where((t) => t.date.equals(date))).get();

  Stream<List<Asteroid>> watchAllAsteroids() => select(asteroids).watch();

  Future insertAsteroid(Asteroid asteroid) => into(asteroids).insert(asteroid, orReplace: true);
  Future insertAllAsteroids(List<Asteroid> asteroidList) => into(asteroids).insertAll(asteroidList, orReplace: true);

  Future updateAsteroid(Asteroid asteroid) => update(asteroids).replace(asteroid);

  Future deleteAsteroid(Asteroid asteroid) => delete(asteroids).delete(asteroid);
}

@UseMoor(tables: [Asteroids], daos: [AsteroidsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 2;
}