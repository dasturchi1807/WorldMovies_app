
import 'package:films_app/pages/youtube/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/colors.dart';

class Youtube extends StatefulWidget {
  String filmKey;
  Youtube({super.key, required this.filmKey});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = params(widget.filmKey);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.toggleFullScreenMode();
    },);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
          player: YoutubePlayer(
            actionsPadding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
            bottomActions: [
              const CurrentPosition(),
              const SizedBox(width: 5,),
              ProgressBar(
                colors: ProgressBarColors(
                    backgroundColor: Colors.white,
                    bufferedColor: Colors.black.withOpacity(0.5),
                    playedColor: Colors.red,
                    handleColor: Colors.red),
                isExpanded: true,
              ),
              const PlaybackSpeedButton(),
            ],
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            topActions: <Widget>[
              // const SizedBox(width: 8.0),
              IconButton(
                  onPressed: () {
                    _controller.toggleFullScreenMode();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: AppColors.white,)),
            ],
          ),
          builder: (context, player) {
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white,)),
                title: const Text("YouTube Player"),
              ),
              body: player,
            );
          },
    );
  }
}

// WillPopScope(
// onWillPop: () async {
// _controller.toggleFullScreenMode();
// Navigator.pop(context);
// return true;
// },
// child: