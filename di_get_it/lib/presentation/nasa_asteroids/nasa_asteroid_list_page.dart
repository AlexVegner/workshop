import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storage/common/routes/routes.dart';
import 'package:storage/data/nasa_asteroid/models/nasa_asteroid.dart';
import 'package:storage/domain/nasa_asteroid/entities/nasa_asteroid_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/nasa_asteroid_bloc.dart';

class NasaAsteroidListPage extends StatefulWidget {
  NasaAsteroidListPage({Key key}) : super(key: key);

  @override
  _NasaAsteroidListPageState createState() => _NasaAsteroidListPageState();
}

class _NasaAsteroidListPageState extends State<NasaAsteroidListPage> {
  String _selectedDate = '';
  List<NasaAsteroid> _asteroidList;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NasaAsteroidBloc>(context)
        .add(NasaAsteroidLoadTodayEvent());
  }
 
  void _showNetworkErrorDialog() {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("No Connection"),
          content: new Text("Network connection error, try again later"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  BlocProvider.of<NasaAsteroidBloc>(context)
                      .add(NasaAsteroidLoadByDateEvent(_selectedDate));
                },
                child: Text('Retry')),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Calcel')),
          ],
        ));
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showAsteroid(NasaAsteroidEntity asteroid) {
    Navigator.of(context).pushNamed(Routes.createFavoriteDetails(asteroid));
  }

  Widget _buildAsteroidList() {
    if (_asteroidList == null) {
      return _buildProgressBar();
    } else {
      return Center(
        child: ListView.builder(
          itemCount: _asteroidList.length,
          itemBuilder: _buildItemList,
        ),
      );
    }
  }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildItemList(BuildContext context, int index) {
    final asteroid = _asteroidList[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          key: Key('asteroid_$index'),
          title: Text(asteroid.name),
          subtitle: Text('Distance: ${asteroid.distance}'),
          onTap: () => _launchURL(asteroid.detailsUrl),
          // onTap: () => _showAsteroid(asteroid),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: _buildAsteroidList(),
      child: BlocConsumer<NasaAsteroidBloc, NasaAsteroidState>(
        listener: (context, state) {
          if (state is NasaAsteroidErrorState) {
            _showNetworkErrorDialog();
          } else if (state is NasaAsteroidLoadingState) {
            setState(() {
              _selectedDate = state.date;
            });
          }
        },
        builder: (context, state) {
          if (state is NasaAsteroidDataState) {
            _asteroidList = state.nasaAsteroidList;
            return _buildAsteroidList();
          } else {
            return _buildProgressBar();
          }
        },
      ),
    );
  }
}
