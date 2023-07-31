import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../widgets/category_movie_slider.dart';
import '../widgets/trending_slider_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Movie Hub",
      //     style: kTitleText,
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrendingSliderWidget(
                  movieList: Movie("", "", "").getMovies(),
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                MovieCategorySlider(
                    category: "Top Rated Movie",
                    movieList: Movie("", "", "").getMovies()),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                MovieCategorySlider(
                    category: "Upcoming Movie",
                    movieList: Movie("", "", "").getMovies()),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //
      // ],),
    );
  }
}
