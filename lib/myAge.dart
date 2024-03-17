import 'package:flutter/material.dart';

class MyAge extends StatefulWidget {
  const MyAge({super.key});

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('My Age'),
    ));
  }
}
