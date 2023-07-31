import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back),
            Text("Details"),
            IconButton(
              icon: Icon(Icons.bookmark_outline),
              onPressed: () {
                print("Added to wishlist");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Image.network(
              "https://th.bing.com/th/id/OIP.ZqUSGS1JdQua65iy_OA9GQHaEK?w=182&h=102&c=7&r=0&o=5&dpr=1.4&pid=1.7",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Image.network("https://th.bing.com/th/id/OIP.9IBYeqL7wGKtxsPLffGxPgHaLH?w=182&h=273&c=7&r=0&o=5&dpr=1.4&pid=1.7", height: 60, width: 40, fit: BoxFit.fill, )
            ],
          )
        ],
      ),
    );
  }
}
