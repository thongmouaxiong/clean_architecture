import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/entities/comment.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:either_dart/either.dart';

abstract class PostRepository {
  Future<Either<AppError, List<Post>>> getPosts();

  Future<Either<AppError, Post?>> getPostById({required int id});

  Future<Either<AppError, Post?>> createPost({required PostModel post});

  Future<Either<AppError, Post?>> updatePost({required PostModel post});

  Future<Either<AppError, List<Comment>>> getCommentsByPostId({required int postId});
}
