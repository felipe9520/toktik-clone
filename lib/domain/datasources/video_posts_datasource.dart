import 'package:toktik/domain/entities/video_post.dart';



abstract class VideoPostDatasource {


  Future<List<VideoPost>> getFaviriteVideosByUser( String userID );

  Future<List<VideoPost>> getTrendimgVideosByPage( int page );


}