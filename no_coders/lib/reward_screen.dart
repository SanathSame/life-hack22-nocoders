import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:no_coders/scan_page.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff454955),
          leading: GestureDetector(
              onTap: () => Get.back(), child: Icon(Icons.arrow_back_ios)),
          actions: [
            Icon(Icons.help),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 200,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff454955)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("+ 500 EcoPoints",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w500,
                          )),
                      Image.asset(
                        "assets/coin.png",
                        height: 20,
                      )
                    ],
                  ),
                  Text("awarded",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text("Thank you for saving the Earth!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff454955),
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                )),
          ),
          LongGreenButton(category: "Return to home")
        ]),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  GreenButton({Key? key, required this.category}) : super(key: key);

  String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        height: 45,
        width: 125,
        child: Center(
          child: Text(category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
              )),
        ),
        decoration: BoxDecoration(
          color: Color(0xff73937e),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class LongGreenButton extends StatelessWidget {
  LongGreenButton({Key? key, required this.category}) : super(key: key);

  String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(() => ScanPage());
      }),
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Container(
          height: 45,
          child: Center(
            child: Text(category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                )),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff73937e), width: 2),
            color: Color(0xff73937e),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
