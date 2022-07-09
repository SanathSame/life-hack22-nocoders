// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:no_coders/image_controller.dart';
// import 'package:image/image.dart' as img;
// import 'package:tflite_maven/tflite.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// const String ssd = "SSD MobileNet";

// class _HomePageState extends State<HomePage> {
//   ImageController imageCon = Get.find<ImageController>();

//   String _model = ssd;

//   late double _imageWidth;
//   late double _imageHeight;

//   late List _recognitions;

//   @override
//   void initState() {
//     super.initState();
//     imageCon.busy = true;

//     loadModel().then((val) {
//       imageCon.busy = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<ImageController>(builder: (imageCon) {
//         return Column(
//           children: [
//             Center(
//               child: imageCon.image == null
//                   ? Text('No image selected.')
//                   : Container(
//                       constraints: BoxConstraints(
//                           maxHeight: MediaQuery.of(context).size.height / 2),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                       ),
//                       child: imageCon.image,
//                     ),
//             ),
//             SizedBox(
//               height: 36,
//             ),
//             Text(
//               imageCon.category != null ? imageCon.category!.label : '',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               imageCon.category != null
//                   ? 'Confidence: ${imageCon.category!.score.toStringAsFixed(3)}'
//                   : '',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         );
//       }),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 selectFromGallery();
//               },
//               child: Text("From gallery")),
//           ElevatedButton(
//               onPressed: () {
//                 selectFromCamera();
//               },
//               child: Text("From camera"))
//         ],
//       ),
//     );
//   }

//   void selectFromGallery() async {
//     final ImagePicker _picker = ImagePicker();

//     final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       imageCon.imageFile = File(pickedImage.path);
//       imageCon.image = Image.file(imageCon.imageFile!);

//       predictImage(imageCon.imageFile!);
//     }

//     imageCon.update();
//   }

//   void selectFromCamera() async {
//     final ImagePicker _picker = ImagePicker();

//     final pickedImage = await _picker.pickImage(source: ImageSource.camera);

//     if (pickedImage != null) {
//       imageCon.imageFile = File(pickedImage.path);
//       imageCon.image = Image.file(imageCon.imageFile!);
//     }

//     imageCon.update();
//   }

//   loadModel() async {
//     Tflite.close();
//     try {
//       String? res;
//       res = await Tflite.loadModel(
//         model: "assets/test_model.tflite",
//         //labels: "assets/tflite/ssd_mobilenet.txt",
//       );

//       print(res);
//     } on PlatformException {
//       print("Failed to load the model");
//     }
//   }

//   predictImage(File image) async {
//     if (image == null) return;

//     await testModel(image);

//     FileImage(image)
//         .resolve(ImageConfiguration())
//         .addListener((ImageStreamListener((ImageInfo info, bool _) {
//           setState(() {
//             _imageWidth = info.image.width.toDouble();
//             _imageHeight = info.image.height.toDouble();
//           });
//         })));

//     imageCon.imageFile = image;
//     imageCon.busy = false;
//   }

//   testModel(File image) async {
//     var recognitions = await Tflite.detectObjectOnImage(
//         path: image.path, numResultsPerClass: 1);

//     setState(() {
//       _recognitions = recognitions!;
//     });
//   }

//   List<Widget> renderBoxes(Size screen) {
//     if (_recognitions == null) return [];
//     if (_imageWidth == null || _imageHeight == null) return [];

//     double factorX = screen.width;
//     double factorY = _imageHeight / _imageHeight * screen.width;

//     Color blue = Colors.red;

//     return _recognitions.map((re) {
//       return Positioned(
//         left: re["rect"]["x"] * factorX,
//         top: re["rect"]["y"] * factorY,
//         width: re["rect"]["w"] * factorX,
//         height: re["rect"]["h"] * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//             color: blue,
//             width: 3,
//           )),
//           child: Text(
//             "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = blue,
//               color: Colors.white,
//               fontSize: 15,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:no_coders/constants/constants.dart';
import 'package:no_coders/image_controller.dart';
import 'package:tflite_maven/tflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanPage(),
    );
  }
}

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ImageController imageCon = Get.find<ImageController>();

  @override
  void initState() {
    super.initState();
    imageCon.isLoading = true;
    imageCon.update();

    loadModel().then((val) {
      imageCon.isLoading = false;
      imageCon.update();
    });
  }

  loadModel() async {
    Tflite.close();
    try {
      String? res;

      // res = await Tflite.loadModel(
      //   model: "assets/recyclables.tflite",
      //   labels: "assets/recyclables.txt",
      // );
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

  selectFromImagePicker({required ImageSource source}) async {
    final ImagePicker _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) {
      return;
    } else {
      imageCon.isLoading = true;
      imageCon.update();
      predictImage(File(pickedImage.path));
    }
  }

  predictImage(File image) async {
    if (image == null) return;

    if (imageCon.model == yolo) {
      await yolov2Tiny(image);
    } else {
      await ssdMobileNet(image);
    }

    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          setState(() {
            imageCon.imageWidth = info.image.width.toDouble();
            imageCon.imageHeight = info.image.height.toDouble();
          });
        })));

    print(image);
    imageCon.image = image;
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

  List<Widget> renderBoxes(Size screen) {
    if (imageCon.recognitions == null) return [];
    if (imageCon.imageWidth == null || imageCon.imageHeight == null) return [];

    double factorX = screen.width;
    double factorY =
        imageCon.imageHeight! / imageCon.imageHeight! * screen.width;

    Color blue = Colors.red;

    return imageCon.recognitions!.map((re) {
      return Positioned(
        left: re["rect"]["x"] * factorX,
        top: re["rect"]["y"] * factorY,
        width: re["rect"]["w"] * factorX,
        height: re["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: blue,
            width: 3,
          )),
          child: Text(
            "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = blue,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: imageCon.image == null
          ? Text("No Image Selected")
          : Image.file(imageCon.image!),
    ));

    stackChildren.addAll(renderBoxes(size));

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ImageController>(
          builder: (imageCon) {
            return imageCon.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: stackChildren,
                  );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    selectFromImagePicker(source: ImageSource.gallery);
                  },
                  child: Text("From Gallery")),
              ElevatedButton(
                  onPressed: () {
                    selectFromImagePicker(source: ImageSource.camera);
                  },
                  child: Text("From Camera"))
            ],
          ),
        ),
      ),
    );
  }
}
