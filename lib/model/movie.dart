class Movie {
  int id;
  bool isBookmark;
  String title;
  String posterPath;
  String description;
  String releaseDate;
  double rating;

  Movie(
      {required this.isBookmark,
      required this.id,
      required this.title,
      required this.posterPath,
      required this.description,
      required this.releaseDate,
      required this.rating});

  @override
  String toString() {
    // TODO: implement toString
    return "{id: $id, isBookmark: $isBookmark, title: $title, description: $description, posterPath: $posterPath,"
        " releaseDate: $releaseDate, rating: $rating}";
  }
}

// List<Movie> movies = [
//   Movie(
//     title: 'The Shawshank Redemption',
//     description: "slfjsl;dfjskljflks",
//     rating: 4.5,
//     posterPath: "flaskjdf;lkjsad",
//     releaseDate: "1994",
//   ),
//   Movie(
//     title: 'The Godfather',
//     description: ";fdsajfla;jsdkfj",
//     rating: 5.5,
//     posterPath: "dsafsdfasdfhu",
//     releaseDate: "1972",
//   ),
//   Movie(
//     title: 'The Dark Knight',
//     description: "dsfasdafdsa",
//     rating: 8.4,
//     posterPath: "sfadfasdlfasd",
//     releaseDate: "2008",
//   )
// ];

// to add bookmark
