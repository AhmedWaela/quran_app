import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderCubit extends Cubit<List<String>> {
  ReminderCubit() : super([]);

  void addReminder(String reminder) {
    if (reminder.isNotEmpty) {
      emit([...state, reminder]);
    }
  }

  void removeReminder(int index) {
    final updatedReminders = List<String>.from(state);
    updatedReminders.removeAt(index);
    emit(updatedReminders);
  }
}
