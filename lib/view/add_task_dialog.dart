import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const AddTaskDialog({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Task'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Enter your task'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onAdd();
            Navigator.of(context).pop;
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
