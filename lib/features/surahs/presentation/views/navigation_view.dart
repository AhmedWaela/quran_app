import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/reminder/presentation/views/reminder_view.dart';
import 'package:quran_app/features/surahs/presentation/manager/cubit/quran_cubit.dart';
import 'package:quran_app/features/surahs/presentation/views/widgets/quran_view.dart';
import 'package:quran_app/features/surahs/presentation/views/widgets/surahs_view_body.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    QuranView(),
    ReminderView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return IntrinsicHeight(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.menu_book, "quran", 1),
            _buildNavItem(Icons.task, "Reminder", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        width: 80,
        height: 60,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: isSelected ? 5 : 20,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: isSelected ? 1.0 : 0.5,
                child: Column(
                  children: [
                    Icon(icon,
                        size: 30,
                        color: isSelected ? Colors.green : Colors.black54),
                    if (isSelected)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(label,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
