import 'package:meta/meta.dart';

class FavoriteAsteroidEntity {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;
  final String note;
  final int alertLevel;

  FavoriteAsteroidEntity({
    @required this.id,
    @required this.name,
    @required this.timestamp,
    @required this.distance,
    @required this.detailsUrl,
    @required this.note,
    @required this.alertLevel,
  });

  FavoriteAsteroidEntity copyWith({
    int id,
    String name,
    int timestamp,
    double distance,
    String detailsUrl,
    String note,
    int alertLevel,
  }) =>
      FavoriteAsteroidEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        distance: distance ?? this.distance,
        detailsUrl: detailsUrl ?? this.detailsUrl,
        note: note ?? this.note,
        alertLevel: alertLevel ?? this.alertLevel,
      );
}
