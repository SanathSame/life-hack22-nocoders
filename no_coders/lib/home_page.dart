import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:no_coders/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.3),
            Lottie.asset('lib/assets/recycle_lottie.json'),
            SizedBox(height: height * 0.01),
            const Text('Recyclops',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Serif')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/intro');
                },
                child: const Text('Get started')),
            ElevatedButton(
                onPressed: () {
                  Get.to(const Login());
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
