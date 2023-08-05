// to show the list of all movies

import 'package:flutter/material.dart';
import 'package:movie_hub/screens/movie_details.dart';
import 'package:movie_hub/widgets/movie_container.dart';

import '../model/movie.dart';

class MovieGridList extends StatelessWidget {
  MovieGridList({super.key, required this.movies});

  List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemCount: movies!.length,
      itemBuilder: (context, item) {
        return MovieContainer(
          movie: movies![item],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(movie: movies![item]),
              ),
            );
          },
        );
      },
    );
  }
}
