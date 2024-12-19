import 'package:clean_architecture/features/post/domain/entities/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable(createToJson: false)
class CommentModel extends Comment {
  const CommentModel({
    super.postId,
    super.id,
    super.name,
    super.email,
    super.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
