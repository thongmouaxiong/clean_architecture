import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:either_dart/either.dart';

abstract class PostRepository {
  Future<Either<AppError, List<PostModel>>> getPosts();

  Future<Either<AppError, PostModel?>> getPostById({required int id});

  Future<Either<AppError, PostModel?>> createPost({required PostModel post});

  Future<Either<AppError, PostModel?>> updatePost({required PostModel post});
}
