import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NasaAsteroidEntity with EquatableMixin {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;

  NasaAsteroidEntity({
    @required this.id,
    @required this.name,
    @required this.timestamp,
    @required this.distance,
    @required this.detailsUrl,
  });

  NasaAsteroidEntity copyWith({
    int id,
    String name,
    int timestamp,
    double distance,
    String detailsUrl,
    String date,
  }) =>
      NasaAsteroidEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
        distance: distance ?? this.distance,
        detailsUrl: detailsUrl ?? this.detailsUrl,
      );

  @override
  List<Object> get props => [id, name, detailsUrl, distance, timestamp];
}
