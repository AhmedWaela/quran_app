import 'package:flutter/material.dart';

import 'navigator_item.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.selectedIndex,
    this.onTap1,
    this.onTap2,
  });
  final int selectedIndex;
  final void Function()? onTap1;
  final void Function()? onTap2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            width: 1,
            color: Colors.green,
          ))),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigatorItem(
            icon: Icons.home,
            text: "الرئيسية",
            isActive: selectedIndex == 0,
            onTap: onTap1,
          ),
          NavigatorItem(
            icon: Icons.menu_book,
            text: "المصحف",
            isActive: selectedIndex == 1,
            onTap: onTap2,
          ),
        ],
      ),
    );
  }
}
