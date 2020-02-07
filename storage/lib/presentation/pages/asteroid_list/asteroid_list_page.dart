import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/common/network/nasa_ws_client.dart';
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
  List<Asteroid> _asteroidList;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<NasaAsteroidRepository> get nasaAsteroidRepository async =>
      NasaAsteroidRepositoryImpl(
        nasaAsteroidLocalDatasource:
            NasaAsteroidLocalDatasourceSharedPrefetenceImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
        nasaAsteroidNetworkDatasource: NasaAsteroidRemoteDatasourceImpl(
          client: NasaWsClientImpl(http.Client()),
        ),
      );

  NasaAsteroidRemoteDatasource get nasaAsteroidRDS =>
      NasaAsteroidRemoteDatasourceImpl(
        client: NasaWsClientImpl(http.Client()),
      );

  void _getData() async {
    final repository = await nasaAsteroidRepository;
    try {
      // final list = await nasaAsteroidRDS.getAsteroidsByDate('"2019-12-06"');
      final list = await repository.getAsteroidsByDate('2020-01-10');
      if (mounted) {
        setState(() {
          _asteroidList = list;
        });
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _asteroidList = null;
        });
      }
    }
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
        //       nasaAsteroidRDS.getAsteroidsByDate('2019-12-06');
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
