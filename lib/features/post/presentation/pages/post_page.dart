import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/core/utils/app_dialog.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_state.dart';
import 'package:clean_architecture/features/post/presentation/widgets/post_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state.status == StateStatus.error) {
          AppDialog.alert(
              type: AlertType.error, title: "Error", desc: "An error occured.");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Post"),
            leading: const SizedBox.shrink(),
          ),
          body: state.status == StateStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          Post post = state.posts[index];
                          return PostItemWidget(
                            post: post,
                            onTap: (post) async {
                              final data = await AppNavigator.pushNamed(
                                routeName: RouteName.postDetailPage,
                                arguments: post,
                              );
                              if (data != null && data is Post) {
                                postCubit.resetPosts(post: data);
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(height: 1.5),
                          );
                        },
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final data = await AppNavigator.pushNamed(
                routeName: RouteName.createPostPage,
              );
              if (data != null && data is Post) {
                postCubit.resetPosts(post: data);
              }
            },
            backgroundColor: Colors.blue[400],
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
