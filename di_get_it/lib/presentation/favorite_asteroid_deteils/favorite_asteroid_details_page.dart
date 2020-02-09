
import 'package:flutter/material.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';

class FavoriteAsteroidDetailsPage extends StatelessWidget {
  final String id;
  final FavoriteAsteroidEntity asteroid;
  
  FavoriteAsteroidDetailsPage({Key key, this.id, this.asteroid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('FavoriteAsteroidDetailsPage'),
      ),
    );
  }


  
}
