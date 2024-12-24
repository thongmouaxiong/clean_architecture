import 'package:clean_architecture/core/constants/enum/bottom_bar_tab.dart';
import 'package:clean_architecture/core/utils/extension/num_extension.dart';
import 'package:clean_architecture/features/home/presentation/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final BottomBarEnum currentTab;
  final void Function(BottomBarEnum tab)? onTap;

  const BottomBarWidget({
    super.key,
    this.currentTab = BottomBarEnum.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: BottomBarEnum.values.map((tab) {
          return Expanded(
            child: BottomBarItem(
              icon: tab.icon,
              title: tab.title,
              isActived: currentTab == tab,
              onTap: () {
                onTap?.call(tab);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
