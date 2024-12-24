import 'package:clean_architecture/core/global/widgets/app_image.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/num_extension.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  final VoidCallback? onTap;
  final List<Photo> photos;

  const AlbumItem({
    super.key,
    required this.album,
    this.photos = const [],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            GridView.builder(
              itemCount: photos.length >= 4 ? 4 : photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final Photo photo = photos[index];
                return Stack(
                  children: [
                    AppImage(
                      url: photo.url,
                      borderRadius: index.cornerBorderRadius(10),
                    ),
                    if (index == 3 && photos.length > 3)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: 4.cornerBorderRadius(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "+ ${photos.length - 3}",
                          style: context.textTheme.headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                  ],
                );
              },
            ),
            Center(
              child: Container(
                height: 40,
                color: Colors.grey.withOpacity(0.8),
                alignment: Alignment.center,
                child: Text(
                  album.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
