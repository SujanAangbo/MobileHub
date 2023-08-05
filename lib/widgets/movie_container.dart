import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/movie.dart';
import '../screens/movie_details.dart';

class MovieContainer extends StatelessWidget {
  MovieContainer({required this.movie, super.key, required this.onTap});

  final Movie movie;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 250,
        width: 180,
        decoration: BoxDecoration(
          // color: Colors.blue,
          border: Border.all(color: Colors.black26, width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: movie.posterPath.isEmpty
            ? Image.asset(
                "assets/images/no_image.png",
                fit: BoxFit.cover,
              )
            : Image.network(
                '${Constants.IMGURL}${movie.posterPath}',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
