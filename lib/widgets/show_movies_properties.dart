import 'package:flutter/material.dart';

class ShowMovieProperties extends StatelessWidget {
  ShowMovieProperties(
      {Key? key, required this.heading, required this.data, this.icon})
      : super(key: key);

  String heading;
  String data;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return Chip(
        label: Text(
          "$heading: $data",
        ),);
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
