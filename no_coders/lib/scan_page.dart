import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("No Coders")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                selectFromGallery();
              },
              child: const Text("From gallery")),
          ElevatedButton(
              onPressed: () {
                selectFromCamera();
              },
              child: const Text("From camera"))
        ],
      ),
    );
  }
}

void selectFromGallery() async {
  final ImagePicker picker = ImagePicker();

  await picker.pickImage(source: ImageSource.gallery);
}

void selectFromCamera() async {
  final ImagePicker picker = ImagePicker();

  await picker.pickImage(source: ImageSource.camera);
}
