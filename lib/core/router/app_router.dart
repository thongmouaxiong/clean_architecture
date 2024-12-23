import 'package:clean_architecture/core/DI/dependency_injection.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_architecture/features/home/presentation/pages/home_page.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_architecture/features/post/presentation/pages/create_post_page.dart';
import 'package:clean_architecture/features/post/presentation/pages/post_detail_page.dart';
import 'package:clean_architecture/features/post/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<HomeCubit>(
              create: (context) => sl<HomeCubit>(),
              child: const HomePage(),
            );
          },
          settings: const RouteSettings(name: RouteName.homePage),
        );
      case RouteName.postPage:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PostCubit>(
              create: (_) => sl<PostCubit>()..init(),
              child: const PostPage(),
            );
          },
          settings: const RouteSettings(name: RouteName.postPage),
        );
      case RouteName.createPostPage:
        final Post? postArg = settings.arguments as Post?;
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PostCubit>(
              create: (_) => sl<PostCubit>()..setPostData(post: postArg),
              child: const CreatePostPage(),
            );
          },
          settings: const RouteSettings(name: RouteName.createPostPage),
        );
      case RouteName.postDetailPage:
        final Post? postArg = settings.arguments as Post?;
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PostCubit>(
              create: (_) => sl<PostCubit>()
                ..setPostData(post: postArg)
                ..loadComments(),
              child: PostDetailPage(
                post: postArg ?? const Post(),
              ),
            );
          },
          settings: const RouteSettings(name: RouteName.createPostPage),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("Not found page for ${settings.name}"),
            ),
          );
        });
    }
  }
}
