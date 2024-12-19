import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/core/utils/app_dialog.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/double_extension.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_state.dart';
import 'package:clean_architecture/features/post/presentation/widgets/comment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  const PostDetailPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state.status == StateStatus.error) {
          AppDialog.alert(
            type: AlertType.error,
            title: state.error?.title ?? "",
            desc: state.error?.msg ?? "",
          );
        }
      },
      builder: (context, state) {
        final post = postCubit.post ?? this.post;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Post Detail"),
            leading: IconButton(
              onPressed: () {
                AppNavigator.pop(postCubit.post);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              InkWell(
                onTap: () async {
                  final resPost = await AppNavigator.pushNamed(
                    routeName: RouteName.createPostPage,
                    arguments: post,
                  );
                  if (resPost != null && resPost is Post) {
                    postCubit.setPostData(post: resPost);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.edit),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 10,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        post.title ?? "",
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(10),
                      Text(
                        post.body ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Text(
                  "All commnets (${state.comments.length}) :",
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 14),
                ),
                const Gap(4),
                state.status == StateStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        height: 65.height,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.comments.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (_, index) {
                            final comment = state.comments[index];
                            return CommentItemWidget(comment: comment);
                          },
                          separatorBuilder: (_, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Divider(
                                thickness: 1.5,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
