import 'package:flutter/material.dart';
import 'package:no_coders/home_page.dart';
import 'package:no_coders/leaderboard.dart';
import 'package:no_coders/login_page.dart';
import 'package:no_coders/profile.dart';
import 'package:no_coders/scan_page.dart';
import 'intro_page.dart';

Future<void> main() async {
  await Firebase.initialiseApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoCoders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/login': (context) => const Login(),
        '/profile': (context) => ProfileScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
        '/scan': (context) => const ScanPage(),
      },
    );
  }
}
