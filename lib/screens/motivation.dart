import 'package:flutter/material.dart';
import 'package:p_002/components/custom_youtube_player.dart';

class VideoMeta {
  String id;
  String title;

  VideoMeta({required this.id, required this.title});
}

class Motivation extends StatefulWidget {
  const Motivation({Key? key}) : super(key: key);

  @override
  State<Motivation> createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  List<VideoMeta> videoList = [
    VideoMeta(id: "a-nyI0bEiLA", title: "나태함을 버리는 법"),
    VideoMeta(id: "TAcBzw_xyXo", title: "2"),
    VideoMeta(id: "Ff8EBiIq64E", title: "버거운 인간관계 속에서 나를 지키는 방법"),
    VideoMeta(id: "o0eaCbHeSts", title: "남의 말에 휘둘리지 않는 방법"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        VideoMeta videoMeta = videoList[index];

        return ListTile(
            title: Column(
              children: [
                Text(videoMeta.title),
                CustomYoutubePlayer(videoID: videoMeta.id),
              ],
            ),
        );
      },
    );
  }
}
