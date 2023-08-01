import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/model/movie.dart';
import 'package:movie_hub/model/movie_list.dart';
import 'package:movie_hub/screens/movie_details.dart';
import '../constants.dart';

class TrendingSliderWidget extends StatefulWidget {
  List<Movie> movieList;

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
          style: kTitleText,
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          height: 10,
          thickness: 2,
          color: Colors.grey,
        ),
        CarouselSlider.builder(
          itemCount: widget.movieList.length,
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetails()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 300,
                width: 250,
                child: Image.network(
                  widget.movieList[itemIndex].movieUrl,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
