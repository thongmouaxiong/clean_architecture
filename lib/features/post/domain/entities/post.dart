import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? id;
  final String? title;
  final String? body;
  final String? userId;

  const Post({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  @override
  List<Object?> get props => [id, title, body, userId];
}
