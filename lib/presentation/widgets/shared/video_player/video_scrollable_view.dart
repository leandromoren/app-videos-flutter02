import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_player/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    //PageView me permite scrollear
    return PageView.builder(
      //Direccion del scroll
      scrollDirection: Axis.vertical,
      //Rebote de scroll
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //Video player + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption,),
            ),

            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            )
          ],
        );
      },
    );
  }
}
