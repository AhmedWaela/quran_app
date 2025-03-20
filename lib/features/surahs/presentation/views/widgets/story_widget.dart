import 'package:flutter/material.dart';

import '../../../data/models/surah_model/ayah.dart';
import '../story_view.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key, required this.ayah});
  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StoryView(ayah: ayah)),
        );
      },
      child: const CircleAvatar(
        radius: 32,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28,
          child: Text(
            "قرآن",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
