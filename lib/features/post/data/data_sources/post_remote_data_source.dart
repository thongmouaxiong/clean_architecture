import 'package:clean_architecture/core/services/api_service.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:injectable/injectable.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();

  Future<PostModel?> getPostById({required int id});

  Future<PostModel?> createPost({required PostModel post});

  Future<PostModel?> updatePost({required PostModel post});
}

@Injectable(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final ApiService _api;

  PostRemoteDataSourceImpl({required ApiService api}) : _api = api;

  @override
  Future<PostModel?> createPost({required PostModel post}) async {
    return await _api.createPost(post: post);
  }

  @override
  Future<PostModel?> getPostById({required int id}) async {
    return await _api.getPostById(id: id);
  }

  @override
  Future<List<PostModel>> getPosts() async {
    return await _api.getPosts();
  }

  @override
  Future<PostModel?> updatePost({required PostModel post}) async {
    if (post.id != null) {
      return await _api.updatePost(id: post.id!, post: post);
    }
    return null;
  }
}
