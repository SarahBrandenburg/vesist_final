import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_page.dart';
import 'picture_page.dart';
import 'drawing_page.dart';
import 'menu_page.dart';
import 'alert_page.dart';

void main() async {
  // Sicherstellung das Plugins richtig initializiert sind
  WidgetsFlutterBinding.ensureInitialized();
  // Enthält eine Liste der Verfügbaren Kameras auf der App
  final cameras = await availableCameras();

  runApp(
    MaterialApp(
      routes: {
        'CameraPage': (context) => CameraPage(camera: cameras.first),
        'PicturePage': (context) => const PicturePage(imagePath: ''),
        'MenuPage': (context) => const MenuPage(),
        'DrawingPage': (context) => const DrawingPage(imagePath: ''),
        'AlertPage': (context) => const AlertPage(),
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
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AlertPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('assets/images/Logo.gif'));
  }
}
