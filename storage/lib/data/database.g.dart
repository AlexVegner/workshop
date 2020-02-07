// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Asteroid extends DataClass implements Insertable<Asteroid> {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;
  final String date;
  Asteroid(
      {@required this.id,
      @required this.name,
      this.timestamp,
      this.distance,
      @required this.detailsUrl,
      @required this.date});
  factory Asteroid.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Asteroid(
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
  factory Asteroid.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Asteroid(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      distance: serializer.fromJson<double>(json['distance']),
      detailsUrl: serializer.fromJson<String>(json['detailsUrl']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'timestamp': serializer.toJson<int>(timestamp),
      'distance': serializer.toJson<double>(distance),
      'detailsUrl': serializer.toJson<String>(detailsUrl),
      'date': serializer.toJson<String>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Asteroid>>(bool nullToAbsent) {
    return AsteroidsCompanion(
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
    ) as T;
  }

  Asteroid copyWith(
          {int id,
          String name,
          int timestamp,
          double distance,
          String detailsUrl,
          String date}) =>
      Asteroid(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        distance: distance ?? this.distance,
        detailsUrl: detailsUrl ?? this.detailsUrl,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Asteroid(')
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
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Asteroid &&
          other.id == id &&
          other.name == name &&
          other.timestamp == timestamp &&
          other.distance == distance &&
          other.detailsUrl == detailsUrl &&
          other.date == date);
}

class AsteroidsCompanion extends UpdateCompanion<Asteroid> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> timestamp;
  final Value<double> distance;
  final Value<String> detailsUrl;
  final Value<String> date;
  const AsteroidsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.distance = const Value.absent(),
    this.detailsUrl = const Value.absent(),
    this.date = const Value.absent(),
  });
  AsteroidsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> timestamp,
      Value<double> distance,
      Value<String> detailsUrl,
      Value<String> date}) {
    return AsteroidsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      distance: distance ?? this.distance,
      detailsUrl: detailsUrl ?? this.detailsUrl,
      date: date ?? this.date,
    );
  }
}

class $AsteroidsTable extends Asteroids
    with TableInfo<$AsteroidsTable, Asteroid> {
  final GeneratedDatabase _db;
  final String _alias;
  $AsteroidsTable(this._db, [this._alias]);
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
  $AsteroidsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'asteroids';
  @override
  final String actualTableName = 'asteroids';
  @override
  VerificationContext validateIntegrity(AsteroidsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.timestamp.present) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableValue(d.timestamp.value, _timestampMeta));
    } else if (timestamp.isRequired && isInserting) {
      context.missing(_timestampMeta);
    }
    if (d.distance.present) {
      context.handle(_distanceMeta,
          distance.isAcceptableValue(d.distance.value, _distanceMeta));
    } else if (distance.isRequired && isInserting) {
      context.missing(_distanceMeta);
    }
    if (d.detailsUrl.present) {
      context.handle(_detailsUrlMeta,
          detailsUrl.isAcceptableValue(d.detailsUrl.value, _detailsUrlMeta));
    } else if (detailsUrl.isRequired && isInserting) {
      context.missing(_detailsUrlMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Asteroid map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Asteroid.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AsteroidsCompanion d) {
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
  $AsteroidsTable createAlias(String alias) {
    return $AsteroidsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $AsteroidsTable _asteroids;
  $AsteroidsTable get asteroids => _asteroids ??= $AsteroidsTable(this);
  AsteroidsDao _asteroidsDao;
  AsteroidsDao get asteroidsDao =>
      _asteroidsDao ??= AsteroidsDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [asteroids];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AsteroidsDaoMixin on DatabaseAccessor<AppDatabase> {
  $AsteroidsTable get asteroids => db.asteroids;
}
