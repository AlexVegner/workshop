import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/common/errors/no_connection_error.dart';
import 'package:storage/common/network/nasa_ws_client.dart';
import 'package:storage/common/network/network_check.dart';
import 'package:storage/data/database.dart' as db;
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource_moor_impl.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_local_datasource_shared_preferencelocal_impl.dart';
import 'package:storage/data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:storage/data/nasa_asteroid/models/asteroid.dart';
import 'package:storage/data/nasa_asteroid/repositories/nasa_asteroid_repository.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AsteroidListPage extends StatefulWidget {
  AsteroidListPage({Key key}) : super(key: key);

  @override
  _AsteroidListPageState createState() => _AsteroidListPageState();
}

class _AsteroidListPageState extends State<AsteroidListPage> {
  String _selectedDate = '2020-01-11';
  List<Asteroid> _asteroidList;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<NasaAsteroidRepository> get nasaAsteroidRepository async =>
      NasaAsteroidRepositoryImpl(
        nasaAsteroidNetworkDatasource: NasaAsteroidRemoteDatasourceImpl(
          client: NasaWsClientImpl(http.Client()),
        ),
        networkCheck: NetworkCheckImpl(
          connectivity: Connectivity(),
        ),
        nasaAsteroidLocalDatasource:
            NasaAsteroidLocalDatasourceSharedPrefetenceImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
        // nasaAsteroidLocalDatasource:
        //     NasaAsteroidLocalDatasourceMoorImpl(
        //   database: db.AppDatabase(),
        // ),
      );

  NasaAsteroidRemoteDatasource get nasaAsteroidRDS =>
      NasaAsteroidRemoteDatasourceImpl(
        client: NasaWsClientImpl(http.Client()),
      );

  void _getData() async {
    final repository = await nasaAsteroidRepository;
    try {
      // final list = await nasaAsteroidRDS.getAsteroidsByDate(_selectedDate);
      final list = await repository.getAsteroidsByDate(_selectedDate);
      if (mounted) {
        setState(() {
          _asteroidList = list;
        });
      }
    } on NoConnectionError catch (_) {
      _showNetworkErrorDialog();
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _asteroidList = null;
        });
      }
    }
  }

  void _showNetworkErrorDialog() {
    showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text("No Connection"),
            content: new Text("Network connection error, try again later"),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
                _getData();
              }, child: Text('Retry')),
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('Calcel')),
            ],
          ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asteroid Demo'),
      ),
      body: Container(
        child: _buildAsteroidList(),
        // child: FutureBuilder(
        //   future:
        //       nasaAsteroidRepository.then((repository) => repository.getAsteroidsByDate(_selectedDate)),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<List<Asteroid>> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done &&
        //         !snapshot.hasError) {
        //       _asteroidList = snapshot.data;
        //       return _buildAsteroidList();
        //     } else {
        //       return _buildProgressBar();
        //     }
        //   },
        // ),
      ),
    );
  }
}
