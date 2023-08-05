import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/model/movie.dart';
import 'package:movie_hub/screens/movie_details.dart';
import 'package:movie_hub/widgets/movie_container.dart';
import '../constants.dart';

class TrendingSliderWidget extends StatefulWidget {
  Future<List<Movie>> movieList;

  TrendingSliderWidget({super.key, required this.movieList});

  @override
  State<TrendingSliderWidget> createState() => _TrendingSliderWidgetState();
}

class _TrendingSliderWidgetState extends State<TrendingSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trending Movie",
          style: Constants.kTitleText,
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          height: 10,
          thickness: 2,
          color: Colors.grey,
        ),
        FutureBuilder<List<Movie>>(
          future: widget.movieList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been fetched successfully
              List<Movie> movies = snapshot.data!;

              return CarouselSlider.builder(
                itemCount: movies.length,
                options: CarouselOptions(
                  viewportFraction: 0.6,
                  height: 300,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return MovieContainer(
                    movie: movies[itemIndex],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                  movie: movies[itemIndex],
                                )),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
