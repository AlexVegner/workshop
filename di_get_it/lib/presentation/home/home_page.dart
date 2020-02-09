import 'package:flutter/material.dart';
import 'package:storage/presentation/dashboad/dashboard_page.dart';
import 'package:storage/presentation/favorite_asteroid_list/favorite_video_list_page.dart';
import 'package:storage/presentation/nasa_asteroids/nasa_asteroid_list_page.dart';
import 'package:storage/presentation/settings/settings_page.dart';

enum HomePageOptions {
  dashboard,
  serarch,
  favorite,
  settings,
}

class HomePage extends StatefulWidget {
  final HomePageOptions page;

  const HomePage({Key key, this.page = HomePageOptions.serarch}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.page?.index ?? 1;
  }

  final List<Widget> _pages = [
    DashboardPage(),
    NasaAsteroidListPage(),
    FavoriteAsteroidListPage(),
    SettingsPage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemSelected,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
