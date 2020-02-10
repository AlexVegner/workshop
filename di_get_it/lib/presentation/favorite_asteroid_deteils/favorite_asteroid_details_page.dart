import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storage/domain/favorite_ateroid/entities/favorite_asteroid_entity.dart';

import 'bloc/favorite_asteroid_details_bloc.dart';

class FavoriteAsteroidDetailsPage extends StatefulWidget {
  final String id;
  final FavoriteAsteroidEntity asteroid;

  FavoriteAsteroidDetailsPage({Key key, this.id, this.asteroid})
      : super(key: key);

  @override
  _FavoriteAsteroidDetailsPageState createState() =>
      _FavoriteAsteroidDetailsPageState();
}

class _FavoriteAsteroidDetailsPageState
    extends State<FavoriteAsteroidDetailsPage> {
  TextEditingController _noteController;
  TextEditingController _aleartLevelController;
  FavoriteAsteroidEntity _favoriteAsteroidEntity;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    _aleartLevelController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    _aleartLevelController.dispose();
    super.dispose();
  }

  void _save() {
    if (_favoriteAsteroidEntity != null) {
      final newAsteroid = _favoriteAsteroidEntity.copyWith(
        note: _noteController.text,
        alertLevel: int.parse(_aleartLevelController.text),
      );
       BlocProvider.of<FavoriteAsteroidDetailsBloc>(context).add(FavoriteAsteroidDetailsSaveEvent(newAsteroid));
    }
  }

  Widget _buildDetails() {
    return Column(
      children: <Widget>[
        Text('${_favoriteAsteroidEntity.id}'),
        TextField(
          controller: _noteController,
          decoration: InputDecoration(
            hintText: 'Enter note',
          ),
        ),
        TextField(
          controller: _aleartLevelController,
          decoration: InputDecoration(
            hintText: 'Enter alert level',
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            onPressed: _save,
          )
        ],
      ),
      body: Container(
        child: BlocConsumer<FavoriteAsteroidDetailsBloc,
            FavoriteAsteroidDetailsState>(
          listener: (context, state) {
            if (state is FavoriteAsteroidDetailEditState) {
              _aleartLevelController.text = state.favoriteAsteroidEntity.alertLevel.toString();
            }
          },
          builder: (context, state) {
            if (state is FavoriteAsteroidDetailEditState) {
              _favoriteAsteroidEntity = state.favoriteAsteroidEntity;
              return _buildDetails();
            } else {
              return _buildProgressBar();
            }
          },
        ),
      ),
    );
  }
}
