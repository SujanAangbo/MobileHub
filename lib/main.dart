import 'package:flutter/material.dart';
import 'package:movie_hub/screens/favourite.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int bottomNavigationIndex = 0;
  ScrollController scrollController = ScrollController();

  final List<Widget> _pages = [
    const Home(),
    Favourite(),
  ];

  void onBottomNavigationClicked(int index) {
    if (index == bottomNavigationIndex) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
    setState(() {
      bottomNavigationIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "Movie Hub",
        //     style: kTitleText,
        //   ),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: _pages[bottomNavigationIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationClicked,
          currentIndex: bottomNavigationIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Favourite",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Home",
            // ),
          ],
        ),
      ),
      // home: MovieDetails(),
    );
  }
}
