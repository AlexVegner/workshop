import 'package:flutter/material.dart';
import 'package:home_navigation/routes/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void _showFavoriteDetailsPage() {
    Navigator.of(context).pushNamed(Routes.favoriteDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SearchPage'),
            const SizedBox(
              height: 20,
            ),
            // RaisedButton(
            //   child: Text('Details'),
            //   onPressed: _showFavoriteDetailsPage,
            // )
          ],
        ),
      ),
    );
  }
}
