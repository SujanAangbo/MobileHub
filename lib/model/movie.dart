class Movie {
  int id;
  String title;
  String posterPath;
  String description;
  String releaseDate;
  double rating;

  Movie(
      {
      required this.id,
      required this.title,
      required this.posterPath,
      required this.description,
      required this.releaseDate,
      required this.rating});

  @override
  String toString() {
    // TODO: implement toString
    return "{id: $id, title: $title, description: $description, posterPath: $posterPath,"
        " releaseDate: $releaseDate, rating: $rating}";
  }
}
