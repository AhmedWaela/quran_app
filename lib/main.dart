import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/surahs/presentation/views/navigation_view.dart';

import 'features/reminder/presentation/manager/cubit/reminder_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ReminderCubit()),
  ], child: const QuranApp()));
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Uthman"),
      debugShowCheckedModeBanner: false,
      home: NavigationView(),
    );
  }
}
