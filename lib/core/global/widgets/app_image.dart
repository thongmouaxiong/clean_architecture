import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? url;
  final Widget? errorImage;

  final double? width;
  final double? height;

  final BoxFit? fit;

  final BorderRadiusGeometry? borderRadius;

  const AppImage({
    super.key,
    this.url,
    this.errorImage,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final Widget errorWidget = errorImage ??
        Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.image,
            size: 40,
          ),
        );
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: url?.isNotEmpty == true
          ? CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: url!,
              fit: fit,
              errorWidget: (context, url, error) {
                return errorWidget;
              },
              progressIndicatorBuilder: (context, error, url) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : errorWidget,
    );
  }
}
