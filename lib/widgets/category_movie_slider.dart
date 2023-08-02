import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/movie.dart';


class MovieCategorySlider extends StatefulWidget {
  String category;
  List<Movie> movieList;

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
        const Divider(height: 10, thickness: 2, color: Colors.grey,),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.movieList.length,
            itemBuilder: (context, item) {
              return Container(
                margin: const EdgeInsets.all(8),
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network("https://th.bing.com/th/id/R.6af6fd9c37f0de4abb34ea0fd20acce3?rik=55mqMmrTutVR0Q&pid=ImgRaw&r=0" , fit: BoxFit.fill,),
              );
            },
          ),
        ),
      ],
    );
  }
}
