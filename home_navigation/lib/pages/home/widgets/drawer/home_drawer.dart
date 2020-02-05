import 'package:flutter/material.dart';

typedef DrawerCallback = Function(int index);

class HomeDrawer extends StatefulWidget {
  final DrawerCallback callback;

  const HomeDrawer({Key key, @required this.callback}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  void _showDashboardPage() {
    widget.callback(0);
    Navigator.of(context).pop();
  }

  void _showSearchPage() {
    widget.callback(1);
    Navigator.of(context).pop();
  }

  void _showFavoriteListPage() {
    widget.callback(2);
    Navigator.of(context).pop();
  }

  void _showSettingsPage() {
    widget.callback(3);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Dashboard'),
              onPressed: _showDashboardPage,
            ),
            FlatButton(
              child: Text('Search'),
              onPressed: _showSearchPage,
            ),
            FlatButton(
              child: Text('Favorite'),
              onPressed: _showFavoriteListPage,
            ),
            FlatButton(
              child: Text('Settings'),
              onPressed: _showSettingsPage,
            ),
          ],
        ),
      ),
    );
  }
}
