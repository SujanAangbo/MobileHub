import 'package:flutter/material.dart';
import 'package:movie_hub/network_service/api.dart';

import '../model/movie.dart';
import '../widgets/category_movie_slider.dart';
import '../widgets/divide_element.dart';
import '../widgets/searchbar_widget.dart';
import '../widgets/trending_slider_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FocusNode searchFocus = FocusNode();
  TextEditingController searchBoxTextController = TextEditingController();

  late Future<List<Movie>> trendingMovieList;
  late Future<List<Movie>> topRatedMovieList;
  late Future<List<Movie>> upcomingMovieList;

  @override
  void initState() {
    trendingMovieList = Api().getTrendingMovies();
    topRatedMovieList = Api().getTopRatedMovies();
    upcomingMovieList = Api().getUpcomingMovies();
    // print(movieList.);
    super.initState();
  }

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
            SearchBarWidget(searchFocus: searchFocus, searchBoxTextController: searchBoxTextController),
            SizedBox(
              height: 8.0,
            ),
            TrendingSliderWidget(
              movieList: trendingMovieList,
            ),
            const DivideElement(),
            MovieCategorySlider(
                category: "Top Rated Movie",
                movieList: topRatedMovieList),
            const DivideElement(),
            MovieCategorySlider(
                category: "Upcoming Movie",
                movieList: upcomingMovieList),
            const DivideElement(),
          ],
        ),
      );

  }
}
