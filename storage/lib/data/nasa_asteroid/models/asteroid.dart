import 'dart:convert';

import 'package:meta/meta.dart';

class Asteroid {
  final int id;
  final String name;
  final int timestamp;
  final double distance;
  final String detailsUrl;

  Asteroid({
    @required this.id,
    @required this.name,
    @required this.timestamp,
    @required this.distance,
    @required this.detailsUrl,
  });

  factory Asteroid.fromNeoJson(Map<String, dynamic> json) {
    final closeApproachData = json['close_approach_data'] as List<dynamic>;
    final closeApproach = closeApproachData[0] as Map<String, dynamic>;
    final int timestamp = closeApproach['epoch_date_close_approach'];
    final missDistance = closeApproach['miss_distance'] as Map<String, dynamic>;
    final double distance = double.parse(missDistance['kilometers']);

    return Asteroid(
      id: int.parse(json['id']),
      name: json['name'],
      detailsUrl: json['nasa_jpl_url'],
      distance: distance,
      timestamp: timestamp,
    );
  }

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return Asteroid(
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
