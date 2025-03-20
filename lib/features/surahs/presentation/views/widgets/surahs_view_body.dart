import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surahs/presentation/manager/cubit/quran_cubit.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    /// **توليد أرقام عشوائية للسورة، الأوفست، والحد**
    Random random = Random();
    int surahNumber = random.nextInt(114) + 1;
    int offset = random.nextInt(50);
    int limit = random.nextInt(16) + 5;

    return BlocProvider(
      create: (context) => QuranCubit()
        ..getASurahFromQuran(surahNumber, offset: offset, limit: limit),
      child: const HomeViewBody(),
    );
  }
}
