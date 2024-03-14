import 'package:flutter/material.dart';
import 'package:toktik_app/presentation/widgets/shared/video_shared/video_buttons.dart';

import '../../../domain/entities/video_post.dart';
import 'video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
                child: FullScreenPlayer(
                    caption: videoPost.caption, videoUrl: videoPost.videoUrl)),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
