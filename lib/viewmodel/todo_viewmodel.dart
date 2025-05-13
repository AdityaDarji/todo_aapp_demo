import '../model/todo_model.dart';

class TodoViewmodel {
  final List<Todo> _todos = [
    Todo(title: 'Apply to Jobs'),
    Todo(title: 'Research for Eu Job opportunity'),
    Todo(title: 'Finish flutter app'),
    Todo(title: 'Read book'),
  ];

  List<Todo> get todos => _todos;

  void toggleTodoStatus(int index) {
    _todos[index].isdone = !_todos[index].isdone;
  }
}
