import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/home_page.dart';
import 'package:no_coders/dependencies.dart' as dependencies;
import 'package:no_coders/main_screen.dart';

void main() async {
  await dependencies.init();
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
      home: MainScreen(),
    );
  }
}
