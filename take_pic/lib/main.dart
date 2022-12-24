import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _images;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _images = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _images == null
                ? const Text("No image selected")
                : Image.file(_images!)),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
