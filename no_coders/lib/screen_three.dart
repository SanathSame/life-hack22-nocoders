import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/controllers/options_controller.dart';
import 'package:no_coders/extensions/extensions.dart';
import 'package:no_coders/image_controller.dart';
import 'package:no_coders/reward_screen.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageController imageCon = Get.find<ImageController>();
    OptionsController optionCon = Get.find<OptionsController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF454955),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(children: [
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(imageCon.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            imageCon.itemName.capitalise(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (optionCon.isRecyclable)
                                    ? const Color(0xFF73937E)
                                    : const Color(0xFFF96D75)),
                            onPressed: () => {},
                            child: Row(
                              children: [
                                Text(
                                  (optionCon.isRecyclable)
                                      ? "Recyclable"
                                      : "Not Recyclable",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.check,
                                  size: 14,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text("Description",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                          optionCon.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: Text(
                          "How to Recycle",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 50),
                        child: SizedBox(
                          height: 100,
                          child: Text(
                            optionCon.howToRecycle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => {Get.back()},
                        child: Container(
                          width: 35,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF96D75), shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Get.to(() => RewardScreen())},
                        child: Container(
                          width: 35,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Color(0xFF73937E), shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
