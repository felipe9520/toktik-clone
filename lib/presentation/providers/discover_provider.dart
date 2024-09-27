import 'package:flutter/material.dart';

import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';


class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });


  Future<void> loadNextPage() async {

    // await Future.delayed(const Duration(seconds: 2) );

    // final List<VideoPost> newVideos = videoPosts.map( 
    //   ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();
    //* lo que es lo mismo de -->
    //final List<VideoPost> newVideos = videoPosts.map(
    //  ( video ) => VideoPost(
    //    caption: video['name'], 
    //    videoUrl: video['videoUrl'],
    //    likes: video['likes'],
    //    views: video['views']
    //    )      
    //  ).toList();
    final newVideos = await videosRepository.getTrendimgVideosByPage(1);

    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();
  }

}