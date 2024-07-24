import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoService extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos =>
      _todos..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    int index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
