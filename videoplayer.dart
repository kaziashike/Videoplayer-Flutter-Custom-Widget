import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerExtended extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isloop;

  VideoPlayerExtended(
      {@required this.videoPlayerController, @required this.isloop});
  @override
  _VideoPlayerExtendedState createState() => _VideoPlayerExtendedState();
}

class _VideoPlayerExtendedState extends State<VideoPlayerExtended> {
  ChewieController chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.isloop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    chewieController.dispose();
  }
}

class PlayVideo extends StatefulWidget {
  final String videoURL;

  const PlayVideo({@required this.videoURL});
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayerExtended(
      isloop: true,
      videoPlayerController: VideoPlayerController.network(widget.videoURL),
    );
  }
}
