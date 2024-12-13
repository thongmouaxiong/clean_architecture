import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  final Post post;
  final void Function(Post post)? onTap;

  const PostItemWidget({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onTap?.call(post);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${post.id}. ${post.title}",
            style: context.textTheme.bodyLarge,
          ),
          Text(
            post.body ?? "",
          )
        ],
      ),
    );
  }
}
