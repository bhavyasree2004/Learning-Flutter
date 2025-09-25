import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todoList = [];
  List<Todo> get todoList => _todoList;
  void addTask(Todo task) {
    _todoList.add(task);
    notifyListeners();
  }

  void toggleCheckBox(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
