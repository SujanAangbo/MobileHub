import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/functions/movie_function.dart';
import 'package:movie_hub/widgets/icon_widget.dart';
import 'package:movie_hub/widgets/show_movies_properties.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isBookmark = false;

  @override
  void initState() {
    isFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            toolbarHeight: 40,
            centerTitle: true,
            expandedHeight: 400,

            // Creates Actionable Icons in AppBar at right
            actions: [
              IconWidget(
                icon: isBookmark ? Icons.bookmark : Icons.bookmark_outline,
                onPressed: () async {
                  var sharedPref = await SharedPreferences.getInstance();
                  // take the json and decode it
                  String? bookmarkJson =
                      sharedPref.getString(Constants.BOOKMARK_LIST);

                  List<Movie> bmMovies = [];

                  if (isBookmark) {
                    // remove movie from the list
                    removeMovie(bmMovies, widget.movie.id);
                    isBookmark = false;
                  } else {
                    if (bookmarkJson != null) {
                      List<dynamic> jsonMap = jsonDecode(bookmarkJson) as List;
                      bmMovies = MovieFunction().fromMap(jsonMap);
                    }

                    bmMovies.add(Movie(
                        id: widget.movie.id,
                        title: widget.movie.title,
                        posterPath: widget.movie.posterPath,
                        description: widget.movie.description,
                        releaseDate: widget.movie.releaseDate,
                        rating: widget.movie.rating));
                    isBookmark = true;
                  }

                  // again encode the new list(added new movies and add it to the shared preference
                  List<Map<String, dynamic>> objectMap =
                      MovieFunction().toMap(bmMovies);
                  String json = jsonEncode(objectMap);
                  sharedPref.setString(Constants.BOOKMARK_LIST, json);

                  setState(() {});
                },
              ),
            ],

            // Creates Back Button in AppBar
            leading: IconWidget(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            // Add title to the AppBar
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 50,
              child: const Center(
                child: Text("Details"),
              ),
            ),

            // Contents of Expandable/Flexible area
            flexibleSpace: Container(
              margin: const EdgeInsets.only(top: 50),
              child: widget.movie.posterPath.isEmpty
                  ? Image.asset(
                      "assets/images/no_image.png",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )
                  : Image.network(
                      "${Constants.IMGURL}${widget.movie.posterPath}",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
            ),

            // Content of bottom part of AppBar(to show movie name with light black bg)
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black26),
                child: Center(
                  child: Text(
                    widget.movie.title,
                    maxLines: 1,
                    style: Constants.kTitleText,
                  ),
                ),
              ),
            ),
          ),

          // Body of the screen
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Overview",
                      style: Constants.kTitleText,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.movie.description,
                      style: Constants.kDescriptionText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShowMovieProperties(
                        heading: "Release Date",
                        data: widget.movie.releaseDate),
                    const SizedBox(
                      height: 10,
                    ),
                    ShowMovieProperties(
                      heading: "Rating",
                      data: "${widget.movie.rating.toStringAsFixed(1)}/10",
                      icon: Icons.star,
                    ),
                  ],
                )),
          ),
        ],
      )),
    );
  }

  void isFavourite() async {
    var sharedPref = await SharedPreferences.getInstance();
    String? json = sharedPref.getString(Constants.BOOKMARK_LIST);

    if (json == null || json.length == 2) {
      isBookmark = false;
    } else {
      List<dynamic> mapJson = jsonDecode(json);
      List<Movie> movies = MovieFunction().fromMap(mapJson);

      for (int i = 0; i < movies.length; i++) {
        if (movies[i].id == widget.movie.id) {
          isBookmark = true;
          break;
        }
      }
    }
    setState(() {});
  }

  void removeMovie(List<Movie> bmMovies, int id) {
    for (int i = 0; i < bmMovies.length; i++) {
      if (bmMovies[i].id == id) {
        bmMovies.removeAt(i);
        break;
      }
    }
  }
}
