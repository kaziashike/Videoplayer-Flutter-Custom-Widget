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

class PlayVideoNetwork extends StatefulWidget {
  final String address;
  final Bool isLoop;

  const PlayVideoNetwork({@required this.address, @required this.isloop});
  @override
  _PlayVideoNetworkState createState() => _PlayVideoNetworkState();
}

class _PlayVideoNetworkState extends State<PlayVideoNetwork> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayerExtended(
      isloop: widget.isloop,
      videoPlayerController: VideoPlayerController.network(widget.addess),
    );
  }
}

class PlayVideoAsset extends StatefulWidget {
  final String address;
  final Bool isLoop;

  const PlayVideoAsset({@required this.address, @required this.isloop});
  @override
  _PlayVideoAssetState createState() => _PlayVideoAssetState();
}

class _PlayVideoAssetState extends State<PlayVideoAsset> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayerExtended(
      isloop: widget.isloop,
      videoPlayerController: VideoPlayerController.asset(widget.address),
    );
  }
}
