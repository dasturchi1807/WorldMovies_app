import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayerController params(String filmKey) {
  return YoutubePlayerController(
    initialVideoId: filmKey,
    flags: const YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );
}