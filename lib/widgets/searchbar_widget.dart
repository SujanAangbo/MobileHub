import 'package:flutter/material.dart';

import '../constants.dart';

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
    return SearchBar(
      focusNode: searchFocus,
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16.0)),
      hintText: "Search Movies",
      textStyle: MaterialStateProperty.all(Constants.kDescriptionText),
      controller: searchBoxTextController,

      trailing: const [
        Icon(
          Icons.search,
          size: 30,
        ),
      ],
    );
  }
}
