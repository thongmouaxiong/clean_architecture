import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:skeletons_forked/skeletons_forked.dart';

class AppLoading {
  static Skeleton post({
    bool isLoading = false,
    required Widget child,
  }) {
    return Skeleton(
      isLoading: isLoading,
      skeleton: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Column(
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width: 100.width,
                    height: context.textTheme.bodyLarge?.fontSize,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    randomLength: true,
                    height: context.textTheme.bodyLarge?.fontSize,
                    borderRadius: BorderRadius.circular(8),
                    padding: const EdgeInsets.only(bottom: 14, top: 10),
                    minLength: 30.width,
                    maxLength: 75.width,
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width: 100.width,
                    height: context.textTheme.bodyMedium?.fontSize,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width: 100.width,
                    height: context.textTheme.bodyMedium?.fontSize,
                    borderRadius: BorderRadius.circular(8),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    randomLength: true,
                    minLength: 30.width,
                    maxLength: 75.width,
                    height: context.textTheme.bodyMedium?.fontSize,
                    borderRadius: BorderRadius.circular(8),
                    padding: const EdgeInsets.only(bottom: 24),
                  ),
                ),
              ],
            );
          }),
      child: child,
    );
  }

  static Skeleton album({
    bool isLoading = false,
    required Widget child,
  }) {
    return Skeleton(
      isLoading: isLoading,
      skeleton: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          return SkeletonAvatar(
            style: SkeletonAvatarStyle(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
      child: child,
    );
  }

  static Widget card({
    bool isLoading = false,
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    BorderRadiusGeometry? borderRadius,
  }) {
    return Skeleton(
      isLoading: isLoading,
      skeleton: Container(
        margin: margin,
        alignment: alignment ?? Alignment.center,
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: width,
            height: height,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
      ),
      child: child,
    );
  }
}
