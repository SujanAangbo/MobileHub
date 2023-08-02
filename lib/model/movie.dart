class Movie {
  String title;
  String posterPath;
  String description;
  String releaseDate;
  double rating;

  Movie(
      {required this.title,
      required this.posterPath,
      required this.description,
      required this.releaseDate,
      required this.rating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path'],
      description: json['overview'],
      releaseDate: json['release_date'],
      rating: json['vote_average'],
    );
  }
}
