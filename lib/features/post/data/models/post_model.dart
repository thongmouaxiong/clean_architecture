import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class PostModel extends Post {
  const PostModel({
    super.id,
    super.title,
    super.body,
    super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
