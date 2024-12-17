import 'package:clean_architecture/core/constants/error_message.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/extension/dio_errror_extension.dart';
import 'package:clean_architecture/features/post/data/data_sources/post_remote_data_source.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/domain/repositories/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource _postRemote;

  PostRepositoryImpl(this._postRemote);

  @override
  Future<Either<AppError, Post?>> createPost({
    required PostModel post,
  }) async {
    try {
      final result = await _postRemote.createPost(post: post);
      return Right(result);
    } on DioException catch (err) {
      return Left(err.getError());
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.defaultMessage));
    }
  }

  @override
  Future<Either<AppError, Post?>> getPostById({required int id}) async {
    try {
      final result = await _postRemote.getPostById(id: id);
      return Right(result);
    } on DioException catch (err) {
      return Left(err.getError());
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.defaultMessage));
    }
  }

  @override
  Future<Either<AppError, List<Post>>> getPosts() async {
    try {
      final result = await _postRemote.getPosts();
      return Right(result);
    } on DioException catch (err) {
      return Left(err.getError());
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.defaultMessage));
    }
  }

  @override
  Future<Either<AppError, Post?>> updatePost({
    required PostModel post,
  }) async {
    try {
      final result = await _postRemote.updatePost(post: post);
      return Right(result);
    } on DioException catch (err) {
      return Left(err.getError());
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.defaultMessage));
    }
  }
}
