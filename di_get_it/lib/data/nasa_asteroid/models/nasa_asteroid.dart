import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';

class NasaAsteroid extends NasaAsteroidEntity {

  NasaAsteroid({
    @required int id,
    @required String name,
    @required int timestamp,
    @required double distance,
    @required String detailsUrl,
  }): super(
    id: id,
    name: name,
    timestamp: timestamp,
    distance: distance,
    detailsUrl: detailsUrl,
  );

  factory NasaAsteroid.fromNeoJson(Map<String, dynamic> json) {
    final closeApproachData = json['close_approach_data'] as List<dynamic>;
    final closeApproach = closeApproachData[0] as Map<String, dynamic>;
    final int timestamp = closeApproach['epoch_date_close_approach'];
    final missDistance = closeApproach['miss_distance'] as Map<String, dynamic>;
    final double distance = double.parse(missDistance['kilometers']);

    return NasaAsteroid(
      id: int.parse(json['id']),
      name: json['name'],
      detailsUrl: json['nasa_jpl_url'],
      distance: distance,
      timestamp: timestamp,
    );
  }

  factory NasaAsteroid.fromJson(Map<String, dynamic> json) {
    return NasaAsteroid(
      id: json['id'],
      name: json['name'],
      detailsUrl: json['detailsUrl'],
      distance: json['distance'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'detailsUrl': detailsUrl,
      'distance': distance,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
