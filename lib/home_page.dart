import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_api/api_helper.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Gallery App",
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: (image != null)
                  ? FileImage(image!)
                  : const NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () async {
                ImagePicker picker = ImagePicker();

                XFile? xFile = await picker.pickImage(
                  source: ImageSource.gallery,
                );

                if (xFile != null) {
                  image = File(xFile.path);
                }
                setState(() {});
              },
              child: const Text('Pick Image'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (image != null) {
                  await APIHelper.apiHelper.postImage(image: image!);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
