import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:test_appliction/Picture_page.dart';
import 'Picture_page.dart';
//import 'package:test_appliction/index.dart';

// A screen that allows users to take a picture using a given camera.
class CameraPage extends StatefulWidget {
  static const String routeName = '/camera';
  // ignore: use_key_in_widget_constructors
  const CameraPage({
    //super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                final mediaSize = MediaQuery.of(context).size;
                return ClipRect(
                  clipper: _MediaSizeClipper(mediaSize),
                  child: Transform.scale(
                    scale: 1 /
                        (_controller.value.aspectRatio * mediaSize.aspectRatio),
                    alignment: Alignment.topCenter,
                    child: CameraPreview(_controller),
                  ),
                );
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white,
                iconSize: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 6),
                onPressed: () {
                  Navigator.pushNamed(context, 'MenuPage');
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: const Icon(Icons.panorama_fish_eye),
              color: Colors.white,
              iconSize: 100,
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              // Provide an onPressed callback.
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final image = await _controller.takePicture();

                  // If the picture was taken, display it on a new screen.
                  // ignore: use_build_context_synchronously
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PicturePage(
                        // Pass the automatically generated path to
                        // the PicturePage widget.
                        imagePath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
