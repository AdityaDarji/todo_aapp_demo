import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoViewmodel extends ChangeNotifier {
  final List<Todo> _todos = [];
  final TextEditingController taskController = TextEditingController();

  List<Todo> get todos => _todos;

  void addTasks() {
    final text = taskController.text.trim();
    if (text.isNotEmpty) {
      _todos.add(Todo(title: text));
      taskController.clear();
      notifyListeners();
    }
  }

  void toggleTodoStatus(int index) {
    _todos[index].isdone = !_todos[index].isdone;
    notifyListeners();
  }

  void deleteTasks(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
