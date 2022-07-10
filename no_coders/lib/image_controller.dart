import 'dart:io';

import 'package:get/get.dart';
import 'package:no_coders/constants/constants.dart';
import 'package:no_coders/scan_page.dart';

class ImageController extends GetxController {
  String model = ssd;
  File? image;

  double? imageWidth;
  double? imageHeight;

  bool isLoading = false;

  List? recognitions;

  late String itemName;
  late double confidenceLevel;

  void renderImage() {
    recognitions!.sort((a, b) => (a as Map).compareTo(b));
    print(recognitions!);
    itemName = recognitions![0]["detectedClass"];
    confidenceLevel = recognitions![0]["confidenceInClass"] * 100;
    print(confidenceLevel);
    update();
  }
}
