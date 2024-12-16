import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final int? userId;

  const Post({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  PostModel toModel() {
    return PostModel(
      id: id,
      title: title,
      body: body,
      userId: userId,
    );
  }

  @override
  List<Object?> get props => [id, title, body, userId];
}
