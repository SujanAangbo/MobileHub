import 'package:flutter/material.dart';

class ShowMovieProperties extends StatelessWidget {
  const ShowMovieProperties(
      {Key? key, required this.heading, required this.data, this.icon})
      : super(key: key);

  final String heading;
  final String data;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return Chip(
        label: Text(
          "$heading: $data",
        ),
      );
    } else {
      return Chip(
        label: Text(
          "$heading: $data",
        ),
        avatar: const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }
  }
}
