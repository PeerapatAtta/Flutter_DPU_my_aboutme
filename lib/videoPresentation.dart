import 'package:flutter/material.dart';

class VideoPresentation extends StatefulWidget {
  const VideoPresentation({super.key});

  @override
  State<VideoPresentation> createState() => _VideoPresentationState();
}

class _VideoPresentationState extends State<VideoPresentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Video Presentation'),
      ),
    );
  }
}
