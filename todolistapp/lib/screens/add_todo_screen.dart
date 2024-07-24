import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_form.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TodoForm(
          onSave: (title, description, color) {
            final now = DateTime.now();
            Navigator.pop(
              context,
              Todo(
                id: now.millisecondsSinceEpoch.toString(),
                title: title,
                description: description,
                createdAt: now,
                updatedAt: now,
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }
}
