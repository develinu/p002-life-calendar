import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String videoID;

  const CustomYoutubePlayer({
    Key? key,
    required this.videoID
  }) : super(key: key);

  @override
  State<CustomYoutubePlayer> createState() => _YoutubePlayerState(videoID);
}

class _YoutubePlayerState extends State<CustomYoutubePlayer> {
  final String _videoID;

  _YoutubePlayerState(this._videoID);

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoID,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      key: ObjectKey(_controller),
      controller: _controller,
      actionsPadding: const EdgeInsets.only(left: 16.0),
      bottomActions: [
        CurrentPosition(),
        const SizedBox(width: 10.0),
        ProgressBar(isExpanded: true),
        const SizedBox(width: 10.0),
        RemainingDuration(),
        //FullScreenButton(),
      ],
    );
  }
}
