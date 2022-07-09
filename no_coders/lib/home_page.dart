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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(children: [
        ElevatedButton(
            onPressed: () {
              selectFromImagePicker();
            },
            child: Text("From gallery"))
      ]),
    );
  }
}

void selectFromImagePicker() async {
  final ImagePicker _picker = ImagePicker();

  await _picker.pickImage(source: ImageSource.gallery);
}
