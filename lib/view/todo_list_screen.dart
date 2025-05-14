import 'package:flutter/material.dart';
import 'package:todo_app_demo/main.dart';
import 'package:todo_app_demo/view/add_task_dialog.dart';
//import 'package:todo_app_demo/model/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_demo/viewmodel/todo_viewmodel.dart';

/*
void _showAddTaskDialog(
  BuildContext context,
  TextEditingController controller,
  VoidCallback onAdd,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AddTaskDialog(controller: controller, onAdd: onAdd);
    },
  );
}*/

class TodoListScreen extends StatelessWidget {
  //final TodoViewmodel _viewmodel = TodoViewmodel();

  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewmodel>(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: "Toggle Theme",
            onPressed: () {
              MyApp.themeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
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
            itemCount: viewModel.todos.length,
            itemBuilder: (context, index) {
              final todo = viewModel.todos[index];
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
                  viewModel.toggleTodoStatus(index);
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => AddTaskDialog(
                  controller: viewModel.taskController,
                  onAdd: viewModel.addTasks,
                ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
