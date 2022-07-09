import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/home_page.dart';
import 'package:no_coders/dependencies.dart' as dependencies;
import 'package:no_coders/main_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:no_coders/home_page.dart';
import 'package:no_coders/leaderboard.dart';
import 'package:no_coders/login_page.dart';
import 'package:no_coders/profile.dart';
import 'package:no_coders/scan_page.dart';
import 'package:no_coders/reward_screen.dart';
import 'package:no_coders/option_menu.dart';

import 'package:no_coders/login_page.dart';
import 'intro_page.dart';


void main() async {
  await dependencies.init();

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
        '/leaderboard': (context) => LeaderBoard(),
        '/scan': (context) => const ScanPage(),
      },
    );
  }
}
