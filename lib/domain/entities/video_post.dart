class VideoPost {
  
  final String caption;
  final String videoUrl;
  final int views;
  final int likes;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.views = 0,
    this.likes = 0
  });
}