import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Text("From gallery")),
          ElevatedButton(
              onPressed: () {
                selectFromCamera();
              },
              child: Text("From camera"))
        ],
      ),
    );
  }
}

void selectFromGallery() async {
  final ImagePicker _picker = ImagePicker();

  await _picker.pickImage(source: ImageSource.gallery);
}

void selectFromCamera() async {
  final ImagePicker _picker = ImagePicker();

  await _picker.pickImage(source: ImageSource.camera);
}
