import 'package:flutter/material.dart';

class NavigatorItem extends StatelessWidget {
  const NavigatorItem(
      {super.key,
      required this.isActive,
      this.onTap,
      required this.icon,
      required this.text});
  final bool isActive;
  final void Function()? onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Column(
        children: [
          if (isActive)
            Container(
              height: 5,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
              ),
            ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    top: isActive ? -50 : 10,
                    duration: Duration(milliseconds: 500),
                    child: Icon(icon),
                  ),
                  AnimatedPositioned(
                      bottom: isActive ? 10 : -50,
                      duration: Duration(milliseconds: 500),
                      child: Text(text))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
