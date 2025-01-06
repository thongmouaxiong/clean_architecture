import 'package:clean_architecture/core/global/widgets/app_image.dart';
import 'package:clean_architecture/core/global/widgets/app_loading.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_cubit.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons_forked/skeletons_forked.dart';

class PhotoPage extends StatelessWidget {
  final Album album;

  const PhotoPage({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(album.title ?? ""),
          ),
          body: AppLoading.album(
            child: GridView.builder(
              itemCount: state.photos.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                final Photo photo = state.photos[index];
                return AppImage(
                  url: photo.url,
                  loadingImage: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
