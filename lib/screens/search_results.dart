import 'package:flutter/material.dart';
import 'package:movie_hub/widgets/movie_grid_list.dart';
import '../model/movie.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({required this.movies, super.key});

  final Future<List<Movie>> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF303030),
      child: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            List<Movie> movieList = snapshot.data!;
            return MovieGridList(movies: movieList);
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  height: 100, width: 100, child: CircularProgressIndicator()),
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}