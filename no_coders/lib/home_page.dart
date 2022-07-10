import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/recycle_lottie.json'),
            SizedBox(height: height * 0.01),
            const Text('Recyclops',
                style: TextStyle(
                    color: Color(0xFF73937E),
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Serif')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/intro');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF73937E), // Background color
                ),
                child: const Text('Get started')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF73937E)),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
