import 'package:flutter/material.dart';
import 'package:todo_app_demo/main.dart';
//import 'package:todo_app_demo/model/todo_model.dart';
import 'package:todo_app_demo/viewmodel/todo_viewmodel.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoViewmodel _viewmodel = TodoViewmodel();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: "Toggle Theme",
            onPressed: () {
              setState(() {
                MyApp.themeNotifier.value =
                    isDark ? ThemeMode.light : ThemeMode.dark;
              });
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ListView.builder(
            itemCount: _viewmodel.todos.length,
            itemBuilder: (context, index) {
              final todo = _viewmodel.todos[index];
              return ListTile(
                leading: Icon(
                  todo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isdone ? TextDecoration.lineThrough : null,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _viewmodel.toggleTodoStatus(index);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
