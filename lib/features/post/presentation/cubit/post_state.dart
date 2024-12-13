import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'post_state.g.dart';

@CopyWith(copyWithNull: true)
class PostState extends Equatable {
  final StateStatus status;
  final AppError? error;
  final List<Post> posts;

  const PostState({
    this.status = StateStatus.initail,
    this.error,
    this.posts = const [],
  });

  @override
  List<Object?> get props => [status, error, posts];
}
