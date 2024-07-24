import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_form.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;

  EditTodoScreen({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Todo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TodoForm(
          todo: todo,
          onSave: (title, description, color) {
            Navigator.pop(
              context,
              Todo(
                id: todo.id,
                title: title,
                description: description,
                createdAt: todo.createdAt,
                updatedAt: DateTime.now(),
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }
}
