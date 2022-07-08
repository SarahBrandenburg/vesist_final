import 'dart:async';
import 'dart:io';
//import 'dart:html';
//import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/rendering.dart';
//import 'package:drag_down_to_pop/drag_down_to_pop.dart';
import 'Camera_page.dart';
import 'Picture_page.dart';
import 'Drawing_page.dart';
import 'Menu_page.dart';
import 'Alert_page.dart';

//late List<CameraDescription> cameras;
//just a command

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  //final firstCamera = cameras.first;
  runApp(
    MaterialApp(
      routes: {
        'CameraPage': (context) => CameraPage(camera: cameras.first),
        'PicturePage': (context) => PicturePage(imagePath: ''),
        'MenuPage': (context) => MenuPage(),
        'DrawingPage': (context) => const DrawingPage(imagePath: ''),
        'AlertPage': (context) => AlertPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Vesist'),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  //State<MyHomePage> createState() => _MyHomePageState();
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AlertPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('assets/images/Logo.gif'));
  }
}
