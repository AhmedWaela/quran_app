import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/models/surah_model/ayah.dart';
import '../../manager/cubit/quran_cubit.dart';

class TodayAyah extends StatelessWidget {
  const TodayAyah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        int randomAyahNumber = Random().nextInt(6236) + 1;
        return QuranCubit()..getAyahFromQuran(ayahNumber: randomAyahNumber);
      },
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          if (state is TodayAyahFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("حدث خطأ أثناء تحميل الآيات")),
            );
          }
        },
        builder: (context, state) {
          if (state is TodayAyahLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodayAyahLoaded) {
            final Ayah ayah = state.ayahs;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// العنوان وزر المشاركة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "📖 آية اليوم",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(ayah.text ?? "");
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),

                  /// الكارد الذي يحتوي على نص الآية
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity, // لجعلها تأخذ عرض الشاشة
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        '"${ayah.text}"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("لم يتم تحميل البيانات"));
          }
        },
      ),
    );
  }
}
