import 'package:flutter/material.dart';
import 'package:movie_hub/model/movie.dart';

class Favourite extends StatelessWidget {
  Favourite({Key? key}) : super(key: key);

  // List<Movie> list = MoviesList().movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ListView.builder(
            itemCount: 5,

            itemBuilder: (context, item) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  height: 250,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network("https://th.bing.com/th/id/R.6af6fd9c37f0de4abb34ea0fd20acce3?rik=55mqMmrTutVR0Q&pid=ImgRaw&r=0", fit: BoxFit.fill,),
                );
            },
          )
        ],
      ),
    );
  }
}
