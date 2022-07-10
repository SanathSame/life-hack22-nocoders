import 'package:flutter/material.dart';
import 'package:no_coders/nav_bar.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF454955),
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 115, // Set this height
            flexibleSpace: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Column(children: [
                      const Text("Leaderboard",
                          style: TextStyle(
                            color: Color(0xFF454955),
                            fontSize: 25,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.diamond_rounded),
                          Icon(Icons.person_outline_rounded),
                          Icon(Icons.money)
                        ],
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
          body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: ((context, index) => LeaderboardTile(
                    image: "",
                    name: "Tan Yu Qi",
                    score: 600,
                    rank: index + 1,
                  ))),
          bottomNavigationBar: BasicBottomNavBar()),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile(
      {Key? key,
      required this.name,
      required this.score,
      required this.image,
      required this.rank})
      : super(key: key);

  final String name;
  final int score;
  final String image;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                'assets/avatar.png',
                height: 21,
              ),
              SizedBox(
                width: 10,
              ),
              Text("#" + rank.toString(),
                  style: TextStyle(
                    color: Color(0xFF454955),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
          Text(name,
              style: TextStyle(
                color: Color(0xFF454955),
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              )),
          Text(score.toString(),
              style: TextStyle(
                color: Color(0xFF454955),
                fontSize: 14,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
              )),
        ]),
      ),
    );
  }
}
