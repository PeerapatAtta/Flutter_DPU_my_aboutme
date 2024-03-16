import 'package:flutter/material.dart';
import 'package:video_url_validator/video_url_validator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPresentation extends StatefulWidget {
  const VideoPresentation({super.key});

  @override
  State<VideoPresentation> createState() => _VideoPresentationState();
}

class _VideoPresentationState extends State<VideoPresentation> {
  late YoutubePlayerController controller;
  late String youtubePath =
      'https://www.youtube.com/watch?v=1ukSR1GRtMU&list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ';

  var validator = VideoURLValidator();
  late bool validatorStatus =
      validator.validateYouTubeVideoURL(url: youtubePath);

  @override
  void initState() {
    if (validatorStatus == true) {
      controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(youtubePath)!);
    }
    ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Video Presentation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      if (validatorStatus == true)
                        YoutubePlayer(
                            controller: controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amberAccent)),
                      if (validatorStatus == false)
                        Center(
                          child: Text('No Video'),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
