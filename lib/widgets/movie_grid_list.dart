// to show the list of all movies
import 'package:flutter/material.dart';
import 'package:movie_hub/screens/movie_details.dart';
import 'package:movie_hub/widgets/movie_container.dart';
import '../model/movie.dart';

class MovieGridList extends StatefulWidget {
  const MovieGridList({super.key, required this.movies});

  final List<Movie> movies;

  @override
  State<MovieGridList> createState() => _MovieGridListState();
}

class _MovieGridListState extends State<MovieGridList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
      itemCount: widget.movies.length,
      itemBuilder: (context, item) {
        return MovieContainer(
          movie: widget.movies[item],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(movie: widget.movies[item]),
              ),
            );
            setState(() {});
          },
        );
      },
    );
  }
}
