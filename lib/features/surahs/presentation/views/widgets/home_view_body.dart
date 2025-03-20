import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import 'stories_list_view.dart';
import 'today_ayah.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// **التاريخ الهجري**
    var hijriCalendar = HijriCalendar.now();
    List<String> hijriMonthsArabic = [
      "محرم",
      "صفر",
      "ربيع الأول",
      "ربيع الآخر",
      "جمادى الأولى",
      "جمادى الآخرة",
      "رجب",
      "شعبان",
      "رمضان",
      "شوال",
      "ذو القعدة",
      "ذو الحجة"
    ];
    int hijriDay = hijriCalendar.hDay;
    int hijriYear = hijriCalendar.hYear;
    String hijriMonth = hijriMonthsArabic[hijriCalendar.hMonth - 1];

    /// **التاريخ الميلادي**
    DateTime now = DateTime.now();
    List<String> monthsArabic = [
      "يناير",
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
    int miladiDay = now.day;
    int miladiYear = now.year;
    String miladiMonth = monthsArabic[now.month - 1];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppBar(
              elevation: 0.0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leading:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              centerTitle: true,
              title: const Text("أذكاري"),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$hijriYear-$hijriMonth-$hijriDay هـ',
                        style: const TextStyle(fontSize: 14)),
                    Text('$miladiYear-$miladiMonth-$miladiDay م',
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(width: 15),
              ],
            ),
            const Text(
              "بسم الله الرحمن الرحيم",
              style: TextStyle(fontSize: 32, color: Colors.green),
            ),
            const SizedBox(height: 16),
            StoriesListView(),
            const SizedBox(height: 20),
            TodayAyah(),
          ],
        ),
      ),
    );
  }
}
