import 'dart:convert';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/model/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  String trendingUrl = '${Constants.HEADING}trending/movie/week?api_key=${Constants.APIKEY}';
  String topRatedUrl = '${Constants.HEADING}movie/top_rated?api_key=${Constants.APIKEY}';
  String upcomingUrl = '${Constants.HEADING}movie/upcoming?api_key=${Constants.APIKEY}';

  Future<List<Movie>> searchMovie(String keyword) async {
    // https://api.themoviedb.org/3/search/movie?query=talk%20to%20me&api_key=04b0909f6feaddcbe52c810675afba3f
    String searchUrl = '${Constants.HEADING}search/movie?query=$keyword&api_key=${Constants.APIKEY}';

    final response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;
      print(decode);

      List<Movie> movieList = [];

      for (int i = 0; i < decode.length; i++) {
        int id = decode[i]['id'];
        bool isBookmark = decode[i]['is_bookmark'];
        String title = decode[i]['title'];
        String posterPath = decode[i]['poster_path'] ?? "";
        String description = decode[i]['overview'];
        String releaseDate = decode[i]['release_date'];
        double rating = decode[i]['vote_average'].toDouble();

        movieList.add(Movie(
          id: id,
            isBookmark: isBookmark,
            title: title,
            posterPath: posterPath,
            description: description,
            releaseDate: releaseDate,
            rating: rating));
      }

      return movieList;

    } else {
      throw ("Network Error");
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;

      print("trending movies \n${decode.toString()}");
      List<Movie> movieList = [];

      for (int i = 0; i < decode.length; i++) {
        int id = decode[i]['id'];
        String title = decode[i]['title'];
        String posterPath = decode[i]['poster_path'];
        String description = decode[i]['overview'];
        String releaseDate = decode[i]['release_date'];
        double rating = decode[i]['vote_average'].toDouble();

        movieList.add(Movie(
          id: id,
            isBookmark: false,
            title: title,
            posterPath: posterPath,
            description: description,
            releaseDate: releaseDate,
            rating: rating));
      }

      return movieList;

    } else {
      throw ("Network Error");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;

      List<Movie> movieList = [];

      for (int i = 0; i < decode.length; i++) {
        int id = decode[i]['id'];
        String title = decode[i]['title'];
        String posterPath = decode[i]['poster_path'];
        String description = decode[i]['overview'];
        String releaseDate = decode[i]['release_date'];
        double rating = decode[i]['vote_average'].toDouble();

        movieList.add(Movie(
          id: id,
            isBookmark: false,
            title: title,
            posterPath: posterPath,
            description: description,
            releaseDate: releaseDate,
            rating: rating));
      }

      return movieList;

    } else {
      throw ("Network Error");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;

      List<Movie> movieList = [];

      for (int i = 0; i < decode.length; i++) {
        int id = decode[i]['id'];
        String title = decode[i]['title'];
        String posterPath = decode[i]['poster_path'];
        String description = decode[i]['overview'];
        String releaseDate = decode[i]['release_date'];
        double rating = decode[i]['vote_average'].toDouble();

        movieList.add(Movie(
          id: id,
            isBookmark: false,
            title: title,
            posterPath: posterPath,
            description: description,
            releaseDate: releaseDate,
            rating: rating));
      }

      return movieList;

    } else {
      throw ("Network Error");
    }
  }
}
