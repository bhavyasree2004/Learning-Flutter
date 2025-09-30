import 'package:flutter_riverpod/legacy.dart';
import 'package:to_do_app_riverpod/todo.dart';

final todoProvider = StateNotifierProvider<ToDoNotifier, List<ToDo>>(
  (ref) => ToDoNotifier(),
);

class ToDoNotifier extends StateNotifier<List<ToDo>> {
  ToDoNotifier() : super([]);
  addTask(ToDo task) {
    state = [...state, task];
  }

  isFinished(bool? isDone, int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(isDone: isDone) else state[i],
    ];
  }

  remove(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }
}
