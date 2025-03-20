import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/reminder/presentation/manager/cubit/reminder_cubit.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ReminderCubit, List<String>>(
          builder: (context, reminders) {
            if (reminders.isEmpty) {
              return Center(
                  child: Text("لا توجد مهام بعد!",
                      style: TextStyle(fontSize: 18)));
            }
            return ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(reminders[index]),
                  onDismissed: (_) =>
                      context.read<ReminderCubit>().removeReminder(index),
                  background: Container(color: Colors.red),
                  child: Card(
                    child: ListTile(
                      title: Text(reminders[index]),
                    ),
                  ),
                );
              },
            );
          },
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: () => _showAddReminderDialog(context),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text("إضافة تذكير"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "أدخل المهمة"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<ReminderCubit>().addReminder(controller.text);
                Navigator.pop(dialogContext);
              }
            },
            child: Text("إضافة"),
          ),
        ],
      ),
    );
  }
}
