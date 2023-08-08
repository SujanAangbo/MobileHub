import 'package:flutter/material.dart';
import 'package:movie_hub/screens/search_results.dart';
import '../constants.dart';
import '../model/movie.dart';
import '../network_service/api.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.searchFocus,
    required this.searchBoxTextController,
  });

  final FocusNode searchFocus;
  final TextEditingController searchBoxTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: searchFocus,
      decoration: InputDecoration(
          hintStyle: Constants.kDescriptionText.copyWith(fontSize: 16),
          hintText: "Search Movies",
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      style: Constants.kDescriptionText.copyWith(fontSize: 16),
      controller: searchBoxTextController,
      maxLines: 1,
      // onTapOutside: searchFocus.dispose(),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (keyword) {
        if (keyword.isNotEmpty) {
          Future<List<Movie>> searchedMovie = Api().searchMovie(keyword);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResults(
                movies: searchedMovie,
              ),
            ),
          );
        }
      },
    );
  }
}
