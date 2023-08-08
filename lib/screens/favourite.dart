import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/model/movie.dart';
import 'package:movie_hub/widgets/movie_grid_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../functions/movie_function.dart';

class Favourite extends StatefulWidget {
  Favourite({Key? key}) : super(key: key);

  List<Movie> list = [];
  bool isEmpty = true;

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    getFavouriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          toolbarHeight: 56,
          title: const Text("Favourites: "),
        ),
        widget.isEmpty
            ? const Center(
                child: Text(
                  "No favourites",
                  style: Constants.kDescriptionText,
                ),
              )
            : MovieGridList(
                movies: widget.list,
              )
      ],
    );
  }

  void getFavouriteList() async {

    var sharedPref = await SharedPreferences.getInstance();
    String? json = sharedPref.getString(Constants.BOOKMARK_LIST);

    if (json == null || json.length == 2) {
      widget.isEmpty = true;
    } else {
      widget.isEmpty = false;
      List<dynamic> jsonMap = jsonDecode(json) as List;
      widget.list = MovieFunction().fromMap(jsonMap);
    }

    setState(() {});
  }
}
