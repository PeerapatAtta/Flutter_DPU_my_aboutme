import 'package:flutter/material.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:my_aboutme/myMap.dart';
import 'package:my_aboutme/profile.dart';
import 'package:my_aboutme/videoPresentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'My About me'),
      routes: <String, WidgetBuilder>{
        'profile':(BuildContext context) => Profile(),
        'video_presentation':(BuildContext context) => VideoPresentation(),
        'my_map':(BuildContext context) => MyMap(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        builder: (context, snapshot) {
          return HomePage();
        },
        future: null,
      ),
    );
  }
}
