import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/movie.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({required this.movie, super.key, required this.onTap});

  final Movie movie;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(8),
          height: 320,
          decoration: BoxDecoration(
            // color: Colors.black26,
            border: Border.all(color: Colors.black26, width: 4),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: Text(
                  maxLines: 1,
                  movie.title,
                  style: Constants.kDescriptionText
                      .copyWith(decoration: TextDecoration.none, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
