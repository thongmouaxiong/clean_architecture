import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
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
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                            onTap: (post) {
                              AppNavigator.pushNamed(
                                routeName: RouteName.createPostPage,
                                arguments: post,
                              );
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
            onPressed: () {
              AppNavigator.pushNamed(routeName: RouteName.createPostPage);
            },
            backgroundColor: Colors.blue[400],
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
