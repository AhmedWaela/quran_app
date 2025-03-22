import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/quran_cubit.dart';
import 'package:quran_app/features/home/presentation/views/home_view.dart';
import 'package:quran_app/features/home/presentation/views/surah_view.dart';

import 'widgets/custom_navigation_bar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});
  static const String route = "/";
  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeView(), QuranView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        selectedIndex: selectedIndex,
        onTap1: () {
          setState(() {
            selectedIndex = 0;
          });
        },
        onTap2: () {
          setState(() {
            selectedIndex = 1;
          });
        },
      ),
    );
  }
}

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..getQuran(),
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0.0,
              title: Text("المصحف الشريف"),
              centerTitle: true,
            ),
            Expanded(
              child: BlocBuilder<QuranCubit, QuranState>(
                builder: (context, state) {
                  if (state is QuranLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QuranFailed) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  } else if (state is QuranLoaded) {
                    if (state.surahs.isEmpty) {
                      return const Center(
                          child: Text("⚠️ لا توجد بيانات متاحة"));
                    }

                    return GridView.builder(
                      itemCount: state.surahs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2, // تناسب أفضل بين العرض والارتفاع
                      ),
                      padding: const EdgeInsets.all(1),
                      itemBuilder: (context, index) {
                        final surah = state.surahs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SurahView.route,
                                arguments: surah);
                          },
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black.withOpacity(0.1), // ظل خفيف
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${surah.number}. ",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(surah.name ?? "",
                                            style: const TextStyle(
                                              fontSize: 20,
                                            )),
                                      ],
                                    ),
                                    Text(
                                        surah.revelationType == "Meccan"
                                            ? "مكية"
                                            : "مدنية",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(child: Text("اضغط لتحديث البيانات"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
