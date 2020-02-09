// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NasaAsteroid extends DataClass implements Insertable<NasaAsteroid> {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;
  final String date;
  NasaAsteroid(
      {@required this.id,
      @required this.name,
      this.timestamp,
      this.distance,
      @required this.detailsUrl,
      @required this.date});
  factory NasaAsteroid.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return NasaAsteroid(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      timestamp:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      distance: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}distance']),
      detailsUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}details_url']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory NasaAsteroid.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NasaAsteroid(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      distance: serializer.fromJson<double>(json['distance']),
      detailsUrl: serializer.fromJson<String>(json['detailsUrl']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'timestamp': serializer.toJson<int>(timestamp),
      'distance': serializer.toJson<double>(distance),
      'detailsUrl': serializer.toJson<String>(detailsUrl),
      'date': serializer.toJson<String>(date),
    };
  }

  @override
  NasaAsteroidsCompanion createCompanion(bool nullToAbsent) {
    return NasaAsteroidsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      detailsUrl: detailsUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(detailsUrl),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  NasaAsteroid copyWith(
          {int id,
          String name,
          int timestamp,
          double distance,
          String detailsUrl,
          String date}) =>
      NasaAsteroid(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        distance: distance ?? this.distance,
        detailsUrl: detailsUrl ?? this.detailsUrl,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('NasaAsteroid(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('timestamp: $timestamp, ')
          ..write('distance: $distance, ')
          ..write('detailsUrl: $detailsUrl, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              timestamp.hashCode,
              $mrjc(distance.hashCode,
                  $mrjc(detailsUrl.hashCode, date.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NasaAsteroid &&
          other.id == this.id &&
          other.name == this.name &&
          other.timestamp == this.timestamp &&
          other.distance == this.distance &&
          other.detailsUrl == this.detailsUrl &&
          other.date == this.date);
}

class NasaAsteroidsCompanion extends UpdateCompanion<NasaAsteroid> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> timestamp;
  final Value<double> distance;
  final Value<String> detailsUrl;
  final Value<String> date;
  const NasaAsteroidsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.distance = const Value.absent(),
    this.detailsUrl = const Value.absent(),
    this.date = const Value.absent(),
  });
  NasaAsteroidsCompanion.insert({
    @required int id,
    @required String name,
    this.timestamp = const Value.absent(),
    this.distance = const Value.absent(),
    @required String detailsUrl,
    @required String date,
  })  : id = Value(id),
        name = Value(name),
        detailsUrl = Value(detailsUrl),
        date = Value(date);
  NasaAsteroidsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> timestamp,
      Value<double> distance,
      Value<String> detailsUrl,
      Value<String> date}) {
    return NasaAsteroidsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      distance: distance ?? this.distance,
      detailsUrl: detailsUrl ?? this.detailsUrl,
      date: date ?? this.date,
    );
  }
}

class $NasaAsteroidsTable extends NasaAsteroids
    with TableInfo<$NasaAsteroidsTable, NasaAsteroid> {
  final GeneratedDatabase _db;
  final String _alias;
  $NasaAsteroidsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedIntColumn _timestamp;
  @override
  GeneratedIntColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedIntColumn _constructTimestamp() {
    return GeneratedIntColumn(
      'timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _distanceMeta = const VerificationMeta('distance');
  GeneratedRealColumn _distance;
  @override
  GeneratedRealColumn get distance => _distance ??= _constructDistance();
  GeneratedRealColumn _constructDistance() {
    return GeneratedRealColumn(
      'distance',
      $tableName,
      true,
    );
  }

  final VerificationMeta _detailsUrlMeta = const VerificationMeta('detailsUrl');
  GeneratedTextColumn _detailsUrl;
  @override
  GeneratedTextColumn get detailsUrl => _detailsUrl ??= _constructDetailsUrl();
  GeneratedTextColumn _constructDetailsUrl() {
    return GeneratedTextColumn('details_url', $tableName, false,
        minTextLength: 1, maxTextLength: 200);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, timestamp, distance, detailsUrl, date];
  @override
  $NasaAsteroidsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nasa_asteroids';
  @override
  final String actualTableName = 'nasa_asteroids';
  @override
  VerificationContext validateIntegrity(NasaAsteroidsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.timestamp.present) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableValue(d.timestamp.value, _timestampMeta));
    }
    if (d.distance.present) {
      context.handle(_distanceMeta,
          distance.isAcceptableValue(d.distance.value, _distanceMeta));
    }
    if (d.detailsUrl.present) {
      context.handle(_detailsUrlMeta,
          detailsUrl.isAcceptableValue(d.detailsUrl.value, _detailsUrlMeta));
    } else if (isInserting) {
      context.missing(_detailsUrlMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NasaAsteroid map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NasaAsteroid.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NasaAsteroidsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.timestamp.present) {
      map['timestamp'] = Variable<int, IntType>(d.timestamp.value);
    }
    if (d.distance.present) {
      map['distance'] = Variable<double, RealType>(d.distance.value);
    }
    if (d.detailsUrl.present) {
      map['details_url'] = Variable<String, StringType>(d.detailsUrl.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    return map;
  }

  @override
  $NasaAsteroidsTable createAlias(String alias) {
    return $NasaAsteroidsTable(_db, alias);
  }
}

class FavoriteAsteroid extends DataClass
    implements Insertable<FavoriteAsteroid> {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;
  final String date;
  final String note;
  final int alertLevel;
  FavoriteAsteroid(
      {@required this.id,
      @required this.name,
      this.timestamp,
      this.distance,
      @required this.detailsUrl,
      @required this.date,
      @required this.note,
      this.alertLevel});
  factory FavoriteAsteroid.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FavoriteAsteroid(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      timestamp:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      distance: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}distance']),
      detailsUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}details_url']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      alertLevel: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}alert_level']),
    );
  }
  factory FavoriteAsteroid.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteAsteroid(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      distance: serializer.fromJson<double>(json['distance']),
      detailsUrl: serializer.fromJson<String>(json['detailsUrl']),
      date: serializer.fromJson<String>(json['date']),
      note: serializer.fromJson<String>(json['note']),
      alertLevel: serializer.fromJson<int>(json['alertLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'timestamp': serializer.toJson<int>(timestamp),
      'distance': serializer.toJson<double>(distance),
      'detailsUrl': serializer.toJson<String>(detailsUrl),
      'date': serializer.toJson<String>(date),
      'note': serializer.toJson<String>(note),
      'alertLevel': serializer.toJson<int>(alertLevel),
    };
  }

  @override
  FavoriteAsteroidsCompanion createCompanion(bool nullToAbsent) {
    return FavoriteAsteroidsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      detailsUrl: detailsUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(detailsUrl),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      alertLevel: alertLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(alertLevel),
    );
  }

  FavoriteAsteroid copyWith(
          {int id,
          String name,
          int timestamp,
          double distance,
          String detailsUrl,
          String date,
          String note,
          int alertLevel}) =>
      FavoriteAsteroid(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        distance: distance ?? this.distance,
        detailsUrl: detailsUrl ?? this.detailsUrl,
        date: date ?? this.date,
        note: note ?? this.note,
        alertLevel: alertLevel ?? this.alertLevel,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteAsteroid(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('timestamp: $timestamp, ')
          ..write('distance: $distance, ')
          ..write('detailsUrl: $detailsUrl, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('alertLevel: $alertLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              timestamp.hashCode,
              $mrjc(
                  distance.hashCode,
                  $mrjc(
                      detailsUrl.hashCode,
                      $mrjc(date.hashCode,
                          $mrjc(note.hashCode, alertLevel.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavoriteAsteroid &&
          other.id == this.id &&
          other.name == this.name &&
          other.timestamp == this.timestamp &&
          other.distance == this.distance &&
          other.detailsUrl == this.detailsUrl &&
          other.date == this.date &&
          other.note == this.note &&
          other.alertLevel == this.alertLevel);
}

class FavoriteAsteroidsCompanion extends UpdateCompanion<FavoriteAsteroid> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> timestamp;
  final Value<double> distance;
  final Value<String> detailsUrl;
  final Value<String> date;
  final Value<String> note;
  final Value<int> alertLevel;
  const FavoriteAsteroidsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.distance = const Value.absent(),
    this.detailsUrl = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.alertLevel = const Value.absent(),
  });
  FavoriteAsteroidsCompanion.insert({
    @required int id,
    @required String name,
    this.timestamp = const Value.absent(),
    this.distance = const Value.absent(),
    @required String detailsUrl,
    @required String date,
    @required String note,
    this.alertLevel = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        detailsUrl = Value(detailsUrl),
        date = Value(date),
        note = Value(note);
  FavoriteAsteroidsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> timestamp,
      Value<double> distance,
      Value<String> detailsUrl,
      Value<String> date,
      Value<String> note,
      Value<int> alertLevel}) {
    return FavoriteAsteroidsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      distance: distance ?? this.distance,
      detailsUrl: detailsUrl ?? this.detailsUrl,
      date: date ?? this.date,
      note: note ?? this.note,
      alertLevel: alertLevel ?? this.alertLevel,
    );
  }
}

class $FavoriteAsteroidsTable extends FavoriteAsteroids
    with TableInfo<$FavoriteAsteroidsTable, FavoriteAsteroid> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoriteAsteroidsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedIntColumn _timestamp;
  @override
  GeneratedIntColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedIntColumn _constructTimestamp() {
    return GeneratedIntColumn(
      'timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _distanceMeta = const VerificationMeta('distance');
  GeneratedRealColumn _distance;
  @override
  GeneratedRealColumn get distance => _distance ??= _constructDistance();
  GeneratedRealColumn _constructDistance() {
    return GeneratedRealColumn(
      'distance',
      $tableName,
      true,
    );
  }

  final VerificationMeta _detailsUrlMeta = const VerificationMeta('detailsUrl');
  GeneratedTextColumn _detailsUrl;
  @override
  GeneratedTextColumn get detailsUrl => _detailsUrl ??= _constructDetailsUrl();
  GeneratedTextColumn _constructDetailsUrl() {
    return GeneratedTextColumn('details_url', $tableName, false,
        minTextLength: 1, maxTextLength: 200);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _alertLevelMeta = const VerificationMeta('alertLevel');
  GeneratedIntColumn _alertLevel;
  @override
  GeneratedIntColumn get alertLevel => _alertLevel ??= _constructAlertLevel();
  GeneratedIntColumn _constructAlertLevel() {
    return GeneratedIntColumn(
      'alert_level',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, timestamp, distance, detailsUrl, date, note, alertLevel];
  @override
  $FavoriteAsteroidsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorite_asteroids';
  @override
  final String actualTableName = 'favorite_asteroids';
  @override
  VerificationContext validateIntegrity(FavoriteAsteroidsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.timestamp.present) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableValue(d.timestamp.value, _timestampMeta));
    }
    if (d.distance.present) {
      context.handle(_distanceMeta,
          distance.isAcceptableValue(d.distance.value, _distanceMeta));
    }
    if (d.detailsUrl.present) {
      context.handle(_detailsUrlMeta,
          detailsUrl.isAcceptableValue(d.detailsUrl.value, _detailsUrlMeta));
    } else if (isInserting) {
      context.missing(_detailsUrlMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (d.note.present) {
      context.handle(
          _noteMeta, note.isAcceptableValue(d.note.value, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (d.alertLevel.present) {
      context.handle(_alertLevelMeta,
          alertLevel.isAcceptableValue(d.alertLevel.value, _alertLevelMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteAsteroid map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavoriteAsteroid.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavoriteAsteroidsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.timestamp.present) {
      map['timestamp'] = Variable<int, IntType>(d.timestamp.value);
    }
    if (d.distance.present) {
      map['distance'] = Variable<double, RealType>(d.distance.value);
    }
    if (d.detailsUrl.present) {
      map['details_url'] = Variable<String, StringType>(d.detailsUrl.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    if (d.note.present) {
      map['note'] = Variable<String, StringType>(d.note.value);
    }
    if (d.alertLevel.present) {
      map['alert_level'] = Variable<int, IntType>(d.alertLevel.value);
    }
    return map;
  }

  @override
  $FavoriteAsteroidsTable createAlias(String alias) {
    return $FavoriteAsteroidsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NasaAsteroidsTable _nasaAsteroids;
  $NasaAsteroidsTable get nasaAsteroids =>
      _nasaAsteroids ??= $NasaAsteroidsTable(this);
  $FavoriteAsteroidsTable _favoriteAsteroids;
  $FavoriteAsteroidsTable get favoriteAsteroids =>
      _favoriteAsteroids ??= $FavoriteAsteroidsTable(this);
  NasaAsteroidsDao _nasaAsteroidsDao;
  NasaAsteroidsDao get nasaAsteroidsDao =>
      _nasaAsteroidsDao ??= NasaAsteroidsDao(this as AppDatabase);
  FavoriteAsteroidsDao _favoriteAsteroidsDao;
  FavoriteAsteroidsDao get favoriteAsteroidsDao =>
      _favoriteAsteroidsDao ??= FavoriteAsteroidsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [nasaAsteroids, favoriteAsteroids];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NasaAsteroidsDaoMixin on DatabaseAccessor<AppDatabase> {
  $NasaAsteroidsTable get nasaAsteroids => db.nasaAsteroids;
}
mixin _$FavoriteAsteroidsDaoMixin on DatabaseAccessor<AppDatabase> {
  $FavoriteAsteroidsTable get favoriteAsteroids => db.favoriteAsteroids;
}
