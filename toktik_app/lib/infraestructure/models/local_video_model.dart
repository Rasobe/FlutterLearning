import 'package:toktik_app/domain/entities/video_post.dart';

class LocalVideoModel {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel(
      {required this.caption,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          caption: json['name'] ?? 'No name',
          videoUrl: json['videoUrl'] ?? 'No video Url',
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0);

  VideoPost toVideoPostEntity() => VideoPost(
      caption: caption, videoUrl: videoUrl, likes: likes, views: views);
}
