import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_cubit.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_state.dart';
import 'package:clean_architecture/features/album/presentation/widgets/album_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Albums"),
            leading: const SizedBox.shrink(),
          ),
          body: GridView.builder(
            itemCount: state.albums.length,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              final Album album = state.albums[index];
              return AlbumItem(
                album: album,
                photos: state.groupPhoto[album.id] ?? [],
                onTap: () {
                  AppNavigator.pushNamed(
                    routeName: RouteName.photoPage,
                    arguments: album,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
