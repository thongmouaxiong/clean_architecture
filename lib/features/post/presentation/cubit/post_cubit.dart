import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/extension/form_state_extension.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/domain/usecases/create_post_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/get_post_by_id_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:clean_architecture/features/post/domain/usecases/update_post_usecase.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> formInitial = {};
  Post? post;

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

  void setPostData({Post? post}) {
    emit(state.copyWith(status: StateStatus.loading));
    if (post != null) {
      this.post = post;
      formInitial = post.toModel().toJson();
    }
    emit(state.copyWith(status: StateStatus.done));
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

  Future<Post?> onCreatePost() async {
    emit(state.copyWith(status: StateStatus.loading));

    PostModel postData = PostModel.fromJson(formKey.formData ?? {});

    Either<AppError, Post?> result;

    if (post != null) {
      postData = postData.copyWith(
        id: post?.id,
        userId: post?.userId,
      );

      result = await _updatePostUsecase(postData);
    } else {
      result = await _createPostUsecase(postData);
    }

    if (result.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: result.left,
      ));
      return null;
    }

    emit(state.copyWith(status: StateStatus.success));
    return result.right;
  }

  void resetPosts({required Post post}) {
    emit(state.copyWith(status: StateStatus.loading));
    List<Post> listPost = state.posts;

    int existPostIndex = listPost.indexWhere((item) => item.id == post.id);

    if (existPostIndex >= 0) {
      listPost[existPostIndex] = post.toModel();
    } else {
      listPost.insert(0, post.toModel());
    }

    emit(state.copyWith(status: StateStatus.done, posts: listPost));
  }
}
