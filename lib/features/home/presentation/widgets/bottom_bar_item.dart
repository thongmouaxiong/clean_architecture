import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActived;
  final VoidCallback? onTap;

  const BottomBarItem({
    super.key,
    required this.icon,
    this.title = "",
    this.isActived = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = isActived ? Colors.blue : Colors.black;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isActived ? Colors.blue.shade50 : Colors.white,
            border: Border(
              top: BorderSide(
                width: 4,
                color: isActived ? Colors.blue : Colors.transparent,
              ),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 10,
                color: Colors.grey.shade300,
                offset: const Offset(0, -5),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: activeColor,
            ),
            const Gap(10),
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 12,
                color: activeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
