import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surahs/data/repo/surahs_repo.dart';
import 'package:quran_app/features/surahs/presentation/manager/cubit/quran_cubit.dart';
import 'package:quran_app/features/surahs/presentation/views/surah_view.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    context
        .read<QuranCubit>()
        .getACompleteQuranEdition("ar", QuranEdition.alafasy);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is QuranLoaded) {
          final surahs = state.surah;
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SurahView(surah: surah);
                    },
                  ));
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      surah.name ?? "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is QuranFailed) {
          return Center(child: Text("حدث خطأ: ${state.message}"));
        }
        return Center(child: Text("لا توجد بيانات متاحة"));
      },
    );
  }
}
