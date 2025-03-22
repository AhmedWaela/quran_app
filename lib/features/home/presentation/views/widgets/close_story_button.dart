import 'package:flutter/material.dart';

class CloseStoryButton extends StatelessWidget {
  const CloseStoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 12),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.0,
                color: Colors.white.withValues(
                  alpha: 255,
                  red: 255,
                  green: 255,
                  blue: 0.5,
                ),
              ),
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
