import 'package:flutter/material.dart';
import 'package:movie_hub/constants.dart';
import 'package:movie_hub/widgets/icon_widget.dart';
import 'package:movie_hub/widgets/show_movies_properties.dart';
import '../model/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            toolbarHeight: 40,
            centerTitle: true,
            expandedHeight: 400,

            // Creates Actionable Icons in AppBar at right
            actions: [
              IconWidget(
                  icon: Icons.bookmark_outline,
                  onPressed: () {
                    print("Bookmark Pressed");
                  })
            ],

            // Creates Back Button in AppBar
            leading: IconWidget(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            // Add title to the AppBar
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 50,
              child: const Center(
                child: Text("Details"),
              ),
            ),

            // Contents of Expandable/Flexible area
            flexibleSpace: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Image.network(
                "${Constants.IMGURL}${movie.posterPath}",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),

            // Content of bottom part of AppBar(to show movie name with light black bg)
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black26),
                child: Center(
                  child: Text(
                    movie.title,
                    maxLines: 1,
                    style: Constants.kTitleText,
                  ),
                ),
              ),
            ),
          ),

          // Body of the screen
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Overview",
                      style: Constants.kTitleText,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      movie.description,
                      style: Constants.kDescriptionText,
                    ),
                    ShowMovieProperties(
                        heading: "Release Date", data: movie.releaseDate),
                    ShowMovieProperties(
                      heading: "Rating",
                      data: "${movie.rating.toStringAsFixed(1)}/10",
                      icon: Icons.star,
                    ),
                  ],
                )),
          ),
        ],
      )),
    );
  }
}

// Initial Design

// class MovieDetails extends StatefulWidget {
//   const MovieDetails({Key? key}) : super(key: key);
//
//   @override
//   State<MovieDetails> createState() => _MovieDetailsState();
// }
//
// class _MovieDetailsState extends State<MovieDetails>
//     with TickerProviderStateMixin {
//   int tabIndex = 0;
//
//   late TabController tabController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//
//             Text("Details"),
//             IconButton(
//               icon: Icon(Icons.bookmark_outline),
//               onPressed: () {
//                 print("Added to wishlist");
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(children: [
//         Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   // border: Border.all(),
//                   color: const Color(0x00242a32)),
//               height: 320,
//             ),
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(20),
//                 bottomLeft: Radius.circular(20),
//               ),
//               child: Image.network(
//                 "https://th.bing.com/th/id/OIP.ZqUSGS1JdQua65iy_OA9GQHaEK?w=182&h=102&c=7&r=0&o=5&dpr=1.4&pid=1.7",
//                 height: 250,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: 200,
//               left: 20.0,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 child: Image.network(
//                   "https://th.bing.com/th/id/OIP.9IBYeqL7wGKtxsPLffGxPgHaLH?w=182&h=273&c=7&r=0&o=5&dpr=1.4&pid=1.7",
//                   height: 100,
//                   width: 80,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 220,
//               right: 10,
//               child: Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 height: 22,
//                 width: 40,
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.star_border,
//                       size: 15,
//                       color: Colors.yellow,
//                     ),
//                     Text(
//                       "4.5",
//                       style: TextStyle(color: Colors.yellow, fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 260,
//               left: 110,
//               right: 5,
//               child: Text(
//                 "Spider Man No Way Home",
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: Constants.kTitleText.copyWith(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.calendar_today_outlined,
//               size: 12,
//             ),
//             SizedBox(width: 5,),
//             Text("2020", style: TextStyle(fontSize: 12),),
//             Container(
//               width: 1.0,
//               height: 12,
//               margin: EdgeInsets.symmetric(horizontal: 8),
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.watch_later_outlined,
//               size: 12,
//             ),
//             SizedBox(width: 5,),
//             Text("2h 30m", style: TextStyle(fontSize: 12),),
//             Container(
//               width: 1.0,
//               height: 12,
//               margin: EdgeInsets.symmetric(horizontal: 8),
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.category_outlined,
//               size: 12,
//             ),
//             SizedBox(width: 5,),
//             Text("Action", style: TextStyle(fontSize: 12),),
//           ],
//         ),
//         SizedBox(height: 10,),
//         TabBar(
//           controller: tabController,
//           tabs: const [
//             Tab(text: 'Details'),
//             Tab(text: "Reviews"),
//             Tab(text: "Cast"),
//           ],
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           onTap: tabElement,
//           // controller: ,
//         ),
//         Container(
//           margin: EdgeInsets.all(10.0),
//           child: getTabData(tabIndex),
//         )
//       ]),
//     );
//   }
//
//   Widget getTabData(int index) {
//     return getTabContent[index];
//   }
//
//   void tabElement(int index) {
//     setState(() {
//       tabIndex = index;
//     });
//   }
//
//   List<Widget> getTabContent = [
//     const Center(
//       child: Text(
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//     ),
//     const Center(
//       child: Text(
//           "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage."),
//     ),
//     const Center(
//       child: Text(
//           "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content."),
//     ),
//   ];
// }
