import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../services/todo_service.dart';
import '../widgets/todo_item.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Todo List')),
      body: Consumer<TodoService>(
        builder: (context, todoService, child) {
          if (todoService.todos.isEmpty) {
            return Center(
              child: Text('No todos yet. Add one!'),
            );
          }
          return ListView.builder(
            itemCount: todoService.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: todoService.todos[index],
                onUpdate: (updatedTodo) {
                  todoService.updateTodo(updatedTodo);
                },
                onDelete: (id) {
                  todoService.deleteTodo(id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
          if (result != null) {
            Provider.of<TodoService>(context, listen: false).addTodo(result);
          }
        },
      ),
    );
  }
}
