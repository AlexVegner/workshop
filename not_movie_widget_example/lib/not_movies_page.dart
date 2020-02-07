import 'package:flutter/material.dart';
import 'package:not_movie_widget_example/not_movie_model.dart';
import 'package:not_movie_widget_example/not_movie_widget.dart';

class NotMoviesPage extends StatelessWidget {
  final List<NotMovieModel> movies = [
    NotMovieModel(
        'Not Movie Not Movie Not Movie Not Movie Not Movie Not Movie Not Movie Not Movie',
        2020,
        'https://m.media-amazon.com/images/M/MV5BOTc1ODY5MTQ1Nl5BMl5BanBnXkFtZTgwMDM5ODI1NjE@._V1_SX300.jpg'),
    NotMovieModel('Also Not Movie Title', 1998,
        'https://m.media-amazon.com/images/M/MV5BOTk2NDNjZWQtMGY0Mi00YTY2LWE5MzctMGRhZmNlYzljYTg5XkEyXkFqcGdeQXVyMTAyNjg4NjE0._V1_SX300.jpg'),
    NotMovieModel('Unknown Not Movie', 1900)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180.0,
              childAspectRatio: 0.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return NotMovieWidget(
                notMovieTitle: movies[index].title,
                notMovieYear: movies[index].year,
                notMoviePosterUrl: movies[index].posterUrl);
          },
        ),
      ),
    );
  }
}
