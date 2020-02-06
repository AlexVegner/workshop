import 'package:flutter/material.dart';
import 'package:network/data/nasa_asteroid/models/asteroid.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common/network/nasa_ws_client.dart';
import 'data/nasa_asteroid/datasources/nasa_asteroid_remote_datasource.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asteroid Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AsteroidPage(),
    );
  }
}

class AsteroidPage extends StatefulWidget {
  AsteroidPage({Key key}) : super(key: key);

  @override
  _AsteroidPageState createState() => _AsteroidPageState();
}

class _AsteroidPageState extends State<AsteroidPage> {
  List<Asteroid> _asteroidList;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  NasaAsteroidRemoteDatasource get nasaAsteroidRDS =>
      NasaAsteroidRemoteDatasourceImpl(
        client: NasaWsClientImpl(http.Client()),
      );

  void _getData() async {
    try {
      final list = await nasaAsteroidRDS.getAsteroidsNearEarch();
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
        //child: _buildAsteroidList(),
        child: FutureBuilder(
          future:
              nasaAsteroidRDS.getAsteroidsNearEarch(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Asteroid>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasError) {
              _asteroidList = snapshot.data;
              return _buildAsteroidList();
            } else {
              return _buildProgressBar();
            }
          },
        ),
      ),
    );
  }
}
