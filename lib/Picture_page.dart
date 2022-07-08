//import 'dart:html';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'Drawing_page.dart';
//import 'package:test_appliction/index.dart';
import 'package:native_opencv/imgproc.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

// A widget that displays the picture taken by the user.
class PicturePage extends StatelessWidget {
  static const String routeName = '/picture';
  final String imagePath;

  // ignore: use_key_in_widget_constructors
  PicturePage({/*super.key,*/ required this.imagePath});
  @override
  int counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              child: Image.file(File(imagePath)),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                IconButton(
                  alignment: Alignment.topRight,
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                  iconSize: 40,
                  padding: const EdgeInsets.fromLTRB(0, 48, 8, 0),
                  onPressed: () {
                    Navigator.pushNamed(context, 'MenuPage');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: null,
                child: const Icon(Icons.close),
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, 'CameraPage');
                }),
            Expanded(child: Container()),
            FloatingActionButton(
                heroTag: null,
                child: const Icon(Icons.check),
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
                onPressed: () async {
                  Directory tempDir = await getTemporaryDirectory();

                  int random = Random().nextInt(10000000);
                  String filePath = '${tempDir.path}/someImg${random}.jpg';
                  processImage(imagePath, filePath);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DrawingPage(imagePath: filePath),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
