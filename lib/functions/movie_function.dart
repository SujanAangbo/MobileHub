import '../model/movie.dart';

class MovieFunction {

  List<Map<String, dynamic>> toMap(List<Movie> movies) {
    List<Map<String, dynamic>> map = [];
    for (int i = 0; i < movies.length; i++) {
      Map<String, dynamic> movie = {
        "id": movies[i].id,
        "title": movies[i].title,
        "poster_path": movies[i].posterPath,
        "overview": movies[i].description,
        "release_date": movies[i].releaseDate,
        "rating": movies[i].rating
      };
      map.add(movie);
    }
    return map;
  }

  List<Movie> fromMap(List<dynamic> map) {
    List<Movie> movies = [];
    for (int i = 0; i < map.length; i++) {
      Movie movie = Movie(
        id: map[i]['id'],
          title: map[i]['title'],
          posterPath: map[i]['poster_path'],
          description: map[i]['overview'],
          releaseDate: map[i]['release_date'],
          rating: map[i]['rating']);

      movies.add(movie);
    }
    return movies;
  }

}