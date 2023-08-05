import 'package:flutter/material.dart';
import 'package:movie_hub/screens/movie_details.dart';
import 'package:movie_hub/widgets/movie_container.dart';

import '../constants.dart';
import '../model/movie.dart';

class MovieCategorySlider extends StatefulWidget {
  String category;
  Future<List<Movie>> movieList;

  MovieCategorySlider(
      {super.key, required this.category, required this.movieList});

  @override
  State<MovieCategorySlider> createState() => _MovieCategorySliderState();
}

class _MovieCategorySliderState extends State<MovieCategorySlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(
          widget.category,
          style: Constants.kTitleText,
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: 10,
          thickness: 2,
          color: Colors.grey,
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: FutureBuilder(
              future: widget.movieList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  List<Movie> movies = snapshot.data as List<Movie>;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, item) {
                      return MovieContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MovieDetails(movie: movies[item]);
                              },
                            ),
                          );
                        },
                        movie: movies[item],
                      );
                    },
                  );
                } else {
                  return Text("Unable to fetch data ${snapshot.error}");
                }
              }),
        ),
      ],
    );
  }
}
