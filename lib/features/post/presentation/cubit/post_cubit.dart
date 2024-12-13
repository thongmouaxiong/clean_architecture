import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/domain/usecases/create_post_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/get_post_by_id_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/update_post_usecase.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PostCubit extends Cubit<PostState> {
  final GetPostsUsecase _getPostsUsecase;
  final GetPostByIdUsecase _getPostByIdUsecase;
  final CreatePostUsecase _createPostUsecase;
  final UpdatePostUsecase _updatePostUsecase;
  PostCubit(
    this._getPostsUsecase,
    this._getPostByIdUsecase,
    this._createPostUsecase,
    this._updatePostUsecase,
  ) : super(const PostState());

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.loading));

    final resPosts = await _getPostsUsecase();

    if (resPosts.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resPosts.left,
      ));
    } else {
      emit(state.copyWith(
        status: StateStatus.done,
        posts: resPosts.right,
      ));
    }
  }

  Future<void> getPostById({required int id}) async {
    emit(state.copyWith(status: StateStatus.loading));

    final resPost = await _getPostByIdUsecase(id);

    if (resPost.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resPost.left,
      ));
    } else {
      emit(state.copyWith(status: StateStatus.done));
    }
  }

  Future<void> onCreatePost({bool isUpdate = false}) async {
    emit(state.copyWith(status: StateStatus.loading));

    PostModel postData = PostModel.fromJson(const {});

    Either<AppError, Post?> result;

    if (isUpdate) {
      result = await _updatePostUsecase(postData);
    } else {
      result = await _createPostUsecase(postData);
    }

    if (result.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: result.left,
      ));
    } else {
      emit(state.copyWith(status: StateStatus.success));
    }
  }
}
