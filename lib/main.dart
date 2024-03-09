import 'package:flutter/material.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:my_aboutme/profile.dart';

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
        'profile':(BuildContext context) => Profile()
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
