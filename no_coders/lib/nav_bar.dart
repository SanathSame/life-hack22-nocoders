import 'package:flutter/material.dart';
import 'package:no_coders/leaderboard.dart';
import 'package:no_coders/scan_page.dart';
import 'package:no_coders/profile.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  static int _selectedIndex = 1;

  static final List<Widget> _pages = <Widget>[
    LeaderBoard(),
    ScanPage(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  _pages[index]),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
    // );
  }
}
