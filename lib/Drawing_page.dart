import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';
import 'package:image/image.dart' as imd;
import 'package:native_opencv/imgproc.dart';
//import 'package:test_appliction/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_appliction/Picture_page.dart';

class DrawingPage extends StatelessWidget {
  static const String routeName = '/drawing';
  final String imagePath;

  // ignore: use_key_in_widget_constructors
  const DrawingPage({/*super.key,*/ required this.imagePath});
  @override
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
              )
              // child: FittedBox(
              //   child: Image.file(File(imagePath)),
              //   fit: BoxFit.cover,
              // ),
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
                onPressed: () async {
                  Navigator.pushNamed(context, 'CameraPage');
                }),
          ],
        ),
      ),
    );
  }
}

class DecodeParam {
  final File file;
  final SendPort sendPort;
  DecodeParam(this.file, this.sendPort);
}

void decodeIsolate(DecodeParam param) {
  // Read an image from file (webp in this case).
  // decodeImage will identify the format of the image and use the appropriate
  // decoder.
  var image = imd.readJpg(param.file.readAsBytesSync())!;
  // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  var thumbnail = imd.copyResize(image, width: 120);
  param.sendPort.send(thumbnail);
}
