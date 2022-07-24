// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  static const String routeName = '/alert';

  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoAlertDialog(
        title: const Text(
          'Vesist möchte auf Ihre Kamera zugreifen',
          style: TextStyle(fontSize: 22),
        ),
        content: const Text(
          'Eine Verweigerung wird die Funktionsweise beeinträchtigen',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Erlauben'),
            onPressed: () => Navigator.popAndPushNamed(context, 'CameraPage'),
          ),
          CupertinoDialogAction(
            child: const Text('Verweigern'),
            onPressed: () => exit(0),
          ),
        ],
      ),
    );
  }
}
