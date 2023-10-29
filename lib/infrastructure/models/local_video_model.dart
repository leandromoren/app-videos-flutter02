import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

String localVideoModelToJson(LocalVideoModel data) => json.encode(data.toJson());

class LocalVideoModel {
  
  final String name;
  final String videoUrl;
  final int views;
  final int likes;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.views = 0,
    this.likes = 0,
  });

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'Name Not found',
    videoUrl: json['videoUrl'] ?? 'Video Not found',
    views: json['views'] ?? 0,
    likes: json['likes'] ?? 0
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "videoUrl": videoUrl,
    "views": views,
    "likes": likes
  };

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    views: views,
    likes: likes); 
}