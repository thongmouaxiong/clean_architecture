import 'package:clean_architecture/core/constants/api_path.dart';
import 'package:clean_architecture/features/album/data/models/album_model.dart';
import 'package:clean_architecture/features/album/data/models/photo_model.dart';
import 'package:clean_architecture/features/post/data/models/comment_model.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(ApiPath.postPath)
  Future<List<PostModel>> getPosts();

  @GET(ApiPath.postByIdPath)
  Future<PostModel?> getPostById({
    @Path("id") required int id,
  });

  @POST(ApiPath.postPath)
  Future<PostModel?> createPost({
    @Body() required PostModel post,
  });

  @PUT(ApiPath.postByIdPath)
  Future<PostModel?> updatePost({
    @Path("id") required int id,
    @Body() required PostModel post,
  });

  @GET(ApiPath.commentPath)
  Future<List<CommentModel>> getCommentsByPostId({
    @Path("id") required int postId,
  });

  @GET(ApiPath.albumPath)
  Future<List<AlbumModel>> getAlbums();

  @GET(ApiPath.photosByAlbumIdPath)
  Future<List<PhotoModel>> getPhotosByAlbumId({
    @Path("albumId") required int albumId,
  });

  @GET(ApiPath.photosPath)
  Future<List<PhotoModel>> getAllPhotos();
}
