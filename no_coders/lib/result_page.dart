import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/image_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:no_coders/extensions/extensions.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ImageController imageCon = Get.find<ImageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF454955),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10.0),
                    child: Text(
                      "RESULT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF73937E),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Open Sans",
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Text(
                    imageCon.itemName.capitalise(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: "Open Sans",
                      color: Color(0xFF454955),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      imageCon.confidenceLevel.toStringAsFixed(0) +
                          "% confidence",
                      style: const TextStyle(
                        color: Color(0xFF73937E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Open Sans",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: LinearPercentIndicator(
                      padding: const EdgeInsets.all(0),
                      alignment: MainAxisAlignment.center,
                      lineHeight: 10,
                      width: 100,
                      percent: imageCon.confidenceLevel / 100,
                      animation: true,
                      progressColor: Color(0xFF73937E),
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      barRadius: const Radius.circular(90),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<ImageController>(builder: (imageCon) {
              return Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(imageCon.image!),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            })
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF73937E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  FeatherIcons.info,
                  size: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Open Sans",
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
