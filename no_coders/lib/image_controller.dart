import 'dart:io';

import 'package:get/get.dart';
import 'package:no_coders/constants/constants.dart';

class ImageController extends GetxController {
  String model = ssd;
  File? image;

  double? imageWidth;
  double? imageHeight;

  bool isLoading = false;

  List? recognitions;
}
