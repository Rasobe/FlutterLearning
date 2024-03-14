import 'package:flutter/material.dart';
import 'package:toktik_app/infraestructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_post.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    ;

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
