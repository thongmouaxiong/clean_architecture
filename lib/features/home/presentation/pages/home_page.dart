import 'package:clean_architecture/core/DI/dependency_injection.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_cubit.dart';
import 'package:clean_architecture/features/album/presentation/pages/album_page.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_architecture/features/home/presentation/cubit/home_state.dart';
import 'package:clean_architecture/features/home/presentation/widgets/bottom_bar_widget.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_architecture/features/post/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();

    PageController pageController = PageController();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: pageController,
            children: [
              BlocProvider<PostCubit>(
                create: (_) => sl<PostCubit>()..init(),
                child: const PostPage(),
              ),
              BlocProvider<AlbumCubit>(
                create: (context) => sl<AlbumCubit>(),
                child: const AlbumPage(),
              ),
            ],
          ),
          bottomNavigationBar: BottomBarWidget(
            currentTab: state.currentTab,
            onTap: (tab) {
              pageController.jumpToPage(tab.index);
              homeCubit.onTabChanged(tab);
            },
          ),
        );
      },
    );
  }
}
