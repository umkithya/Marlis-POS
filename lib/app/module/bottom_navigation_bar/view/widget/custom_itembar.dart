// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBar extends StatelessWidget {
  const ItemBar({
    super.key,
    required this.onTap,
    required this.label,
    this.currentIndex = 0,
    this.onTapIndex = 0,
    required this.icon,
    required this.activeIcon,
  });
  final void Function() onTap;
  // final String assetPath;
  // final String activeAssetPath;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int currentIndex;
  final int onTapIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (Get.width - 60) / 4,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 32,
                width: 32,
                color: Colors.transparent,
                child: currentIndex == 2
                    ? Center(
                        child: Badge(
                          child: Icon(
                            onTapIndex == currentIndex ? activeIcon : icon,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Center(
                        child: Icon(
                          onTapIndex == currentIndex ? activeIcon : icon,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: onTapIndex == currentIndex
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: onTapIndex == currentIndex
                      ? Colors.black
                      : Colors.black.withOpacity(.7),
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
