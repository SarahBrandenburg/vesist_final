// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:io';

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
          SizedBox(
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
