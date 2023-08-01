import 'package:flutter/material.dart';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/model/movie_list.dart';

import '../model/movie.dart';
import '../widgets/category_movie_slider.dart';
import '../widgets/trending_slider_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FocusNode searchFocus = FocusNode();
  TextEditingController searchBoxTextController = TextEditingController();

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              focusNode: searchFocus,
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16.0)),
              hintText: "Search Movies",
              textStyle: MaterialStateProperty.all(kDescriptionText),
              controller: searchBoxTextController,

              trailing: const [
                Icon(
                  Icons.search,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            TrendingSliderWidget(
              movieList: MoviesList().movies,
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
            ),
            MovieCategorySlider(
                category: "Top Rated Movie",
                movieList: MoviesList().movies),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
            ),
            MovieCategorySlider(
                category: "Upcoming Movie",
                movieList: MoviesList().movies),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
            ),
          ],
        ),
      );

  }


}
