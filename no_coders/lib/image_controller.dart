import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/classifier.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ImageController extends GetxController {
  File? imageFile;
  Image? image;

  Category? category;

  bool busy = false;
}
