import 'package:flutter/material.dart';
import 'package:movie_hub/screens/movie_details.dart';
import 'package:movie_hub/widgets/movie_grid_list.dart';

import '../model/movie.dart';
import '../widgets/movie_container.dart';

class SearchResults extends StatelessWidget {
  SearchResults({required this.movies, super.key});

  Future<List<Movie>> movies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Movie> movieList = snapshot.data!;
          return MovieGridList(movies: movieList);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: 50, width: 50, child: const CircularProgressIndicator());
        } else {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        // return Container();
      },
    );
  }
}

//GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2),
//             itemBuilder: (context, index) {
//               MovieContainer(
//                 movie: movies[index],
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MovieDetails(movie: movies[index]),
//                     ),
//                   );
//                 },
//               );
//             },
//           )
