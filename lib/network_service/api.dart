import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/model/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  String trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.APIKEY}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;
      List<Movie> movieList = [];

      for (int i = 0; i < decode.length; i++) {
        String title = decode[i]['title'];
        String posterPath = decode[i]['poster_path'];
        String description = decode[i]['overview'];
        String releaseDate = decode[i]['release_date'];
        double rating = decode[i]['vote_average'];

        movieList.add(Movie(
            title: title,
            posterPath: posterPath,
            description: description,
            releaseDate: releaseDate,
            rating: rating));
      }

      return movieList;

    } else {
      print("Error");
      throw ("Network Error");
    }
  }
}
