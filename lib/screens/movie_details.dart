
import 'package:flutter/material.dart';
import 'package:movie_hub/constants.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with TickerProviderStateMixin {
  int tabIndex = 0;

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

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
      body: Column(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(),
                  color: const Color(0x00242a32)),
              height: 320,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.ZqUSGS1JdQua65iy_OA9GQHaEK?w=182&h=102&c=7&r=0&o=5&dpr=1.4&pid=1.7",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 200,
              left: 20.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  "https://th.bing.com/th/id/OIP.9IBYeqL7wGKtxsPLffGxPgHaLH?w=182&h=273&c=7&r=0&o=5&dpr=1.4&pid=1.7",
                  height: 100,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                height: 22,
                width: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 15,
                      color: Colors.yellow,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.yellow, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 110,
              right: 5,
              child: Text(
                "Spider Man No Way Home",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: kTitleText.copyWith(fontSize: 20),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 12,
            ),
            SizedBox(width: 5,),
            Text("2020", style: TextStyle(fontSize: 12),),
            Container(
              width: 1.0,
              height: 12,
              margin: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
            ),
            Icon(
              Icons.watch_later_outlined,
              size: 12,
            ),
            SizedBox(width: 5,),
            Text("2h 30m", style: TextStyle(fontSize: 12),),
            Container(
              width: 1.0,
              height: 12,
              margin: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
            ),
            Icon(
              Icons.category_outlined,
              size: 12,
            ),
            SizedBox(width: 5,),
            Text("Action", style: TextStyle(fontSize: 12),),
          ],
        ),
        SizedBox(height: 10,),
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'Details'),
            Tab(text: "Reviews"),
            Tab(text: "Cast"),
          ],
          padding: EdgeInsets.symmetric(horizontal: 8),
          onTap: tabElement,
          // controller: ,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: getTabData(tabIndex),
        )
      ]),
    );
  }

  Widget getTabData(int index) {
    return getTabContent[index];
  }

  void tabElement(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  List<Widget> getTabContent = [
    const Center(
      child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    ),
    const Center(
      child: Text(
          "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage."),
    ),
    const Center(
      child: Text(
          "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content."),
    ),
  ];
}
