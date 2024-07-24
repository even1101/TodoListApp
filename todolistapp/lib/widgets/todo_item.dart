import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../screens/edit_todo_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onUpdate;
  final Function(String) onDelete;

  TodoItem(
      {required this.todo, required this.onUpdate, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: todo.color,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTodoScreen(todo: todo),
                      ),
                    );
                    if (result != null) {
                      onUpdate(result);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Todo'),
                        content:
                            Text('Are you sure you want to delete this todo?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text('Delete'),
                            onPressed: () {
                              onDelete(todo.id);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(todo.description),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Updated: ${todo.updatedAt.toString().substring(0, 16)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
