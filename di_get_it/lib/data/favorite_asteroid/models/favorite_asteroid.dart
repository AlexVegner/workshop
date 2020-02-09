import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';

class FavoriteAsteroid extends FavoriteAsteroidEntity {

  FavoriteAsteroid({
    @required int id,
    @required String name,
    @required int timestamp,
    @required double distance,
    @required String detailsUrl,
    @required String note,
    @required int alertLevel,
  }): super(
    id: id,
    name: name,
    timestamp: timestamp,
    distance: distance,
    detailsUrl: detailsUrl,
    note: note,
    alertLevel: alertLevel,
  );

  factory FavoriteAsteroid.fromJson(Map<String, dynamic> json) {
    return FavoriteAsteroid(
      id: json['id'],
      name: json['name'],
      detailsUrl: json['detailsUrl'],
      distance: json['distance'],
      timestamp: json['timestamp'],
      note: json['note'],
      alertLevel: json['alertLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'detailsUrl': detailsUrl,
      'distance': distance,
      'timestamp': timestamp,
      'note': note,
      'alertLevel': alertLevel,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
