import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:no_coders/constants/constants.dart';

import 'package:no_coders/image_controller.dart';
import 'package:no_coders/result_page.dart';
import 'package:tflite_maven/tflite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ImageController imageCon = Get.find<ImageController>();

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF454955),
        body: GetBuilder<ImageController>(builder: (imageCon) {
          return imageCon.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: NoImage(),
                );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GetBuilder<ImageController>(builder: (imageCon) {
          return imageCon.isLoading
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            selectFromImagePicker(source: ImageSource.gallery);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF73937E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                FeatherIcons.image,
                                size: 16,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    "Gallery",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Open Sans",
                                      letterSpacing: 0.5,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            selectFromImagePicker(source: ImageSource.camera);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF73937E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                FeatherIcons.camera,
                                size: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Text(
                                  "Camera",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "Open Sans",
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }

  selectFromImagePicker({required ImageSource source}) async {
    imageCon.isLoading = true;
    imageCon.update();

    final ImagePicker _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) {
      return;
    } else {
      await predictImage(File(pickedImage.path));
      imageCon.renderImage();
      Get.to(() => ResultPage());
    }

    imageCon.isLoading = false;
    imageCon.update();
  }

  yolov2Tiny(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path,
        model: "YOLO",
        threshold: 0.1,
        imageMean: 0.0,
        imageStd: 255.0,
        numResultsPerClass: 1);

    imageCon.recognitions = recognitions!;
    imageCon.update();
  }

  ssdMobileNet(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, numResultsPerClass: 1);

    imageCon.recognitions = recognitions!;
    imageCon.update();
  }

  Future predictImage(File image) async {
    if (image == null) return;

    if (imageCon.model == yolo) {
      await yolov2Tiny(image);
    } else {
      await ssdMobileNet(image);
    }
    print(image);
    imageCon.image = image;
  }

  loadModel() async {
    Tflite.close();
    try {
      String? res;
      if (imageCon.model == yolo) {
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );
      } else {
        res = await Tflite.loadModel(
          model: "assets/ssd_mobilenet.tflite",
          labels: "assets/ssd_mobilenet.txt",
        );
      }
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }
}

class NoImage extends StatelessWidget {
  const NoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          "No image yet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Upload an image!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        )
      ],
    );
  }
}

extension MapExtension on Map {
  int compareTo(Map anotherMap) {
    if (this["confidenceInClass"] < anotherMap["confidenceInClass"]) return 1;
    if (this["confidenceInClass"] > anotherMap["confidenceInClass"]) return -1;

    return 0;
  }
}
