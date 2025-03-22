import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/cubit/azan_timing_cubit.dart';

class AzanTimings extends StatelessWidget {
  const AzanTimings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AzanTimingCubit()..getAzanTiming("21-3-2025", "egypt", "cairo"),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Azan Timings"),
          centerTitle: true,
        ),
        body: BlocBuilder<AzanTimingCubit, AzanTimingState>(
          builder: (context, state) {
            if (state is AzanTimingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AzanTimingLoaded) {
              final timings = state.timings;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildPrayerTile("Fajr", timings.fajr ?? ""),
                    _buildPrayerTile("Dhuhr", timings.dhuhr ?? ""),
                    _buildPrayerTile("Asr", timings.asr ?? ""),
                    _buildPrayerTile("Maghrib", timings.maghrib ?? ""),
                    _buildPrayerTile("Isha", timings.isha ?? ""),
                  ],
                ),
              );
            } else if (state is AzanTimingFailed) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildPrayerTile(String prayer, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        title: Text(
          prayer,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          time,
          style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
        leading: const Icon(Icons.access_time, color: Colors.blue),
      ),
    );
  }
}
