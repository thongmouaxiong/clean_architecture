import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/features/post/domain/entities/comment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommentItemWidget extends StatelessWidget {
  final Comment comment;

  const CommentItemWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const Gap(10),
              Text(
                comment.email ?? "",
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 12),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text(comment.body ?? ""),
          )
        ],
      ),
    );
  }
}
