# Video-Player-Flutter-Custom-Widget
 This is a custom widget by which you can add a video player widget ... 


Installation:

dependencies:
  chewie: <latest_version>
  video_player: <latest_version>




Download the "videoplayer.dart" file and put this on your project lib folder.

Now on the Container( where you want to display the video ), just type PlayVideoAsset(), or PlayVideoNetwork()... this requires 2 parameters, 1. String: address , 2. Bool: Loop on/off

Example:


// Asset Video
Container(
    width: 1920;  //any size you want
    height: 1080;  //any size you want
    Child: PlayVideoAsset( address: 'asset/1.mp4', isloop: True)
)
// Network Video
Container(
    width: 1920;  //any size you want
    height: 1080;  //any size you want
    Child: PlayVideoNetwork( address: 'asset/1.mp4', isloop: True)
)