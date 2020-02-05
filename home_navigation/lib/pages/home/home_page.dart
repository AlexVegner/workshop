
import 'package:flutter/material.dart';
import 'package:home_navigation/pages/dashboard/dashboard_page.dart';
import 'package:home_navigation/pages/favorite_video_list/favorite_video_list_page.dart';
import 'package:home_navigation/pages/home/widgets/drawer/home_drawer.dart';
import 'package:home_navigation/pages/search/search_page.dart';
import 'package:home_navigation/pages/setting/setting_page.dart';

enum HomePageOptions {
  dashboard,
  serarch,
  favorite,
  settings,
}

class HomePage extends StatefulWidget {
  final HomePageOptions page;

  const HomePage({Key key, this.page}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.page?.index ?? 0;
  }

  final List<Widget> _pages = [
    DashboardPage(),
    SearchPage(),
    FavoriteVideoListPage(),
    SettingPage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _pages[_selectedPageIndex],
      drawer: HomeDrawer(callback: _onItemSelected),
      bottomNavigationBar: BottomNavigationBar(
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
    ),
    );
  }
}