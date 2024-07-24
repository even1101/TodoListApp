import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolistapp/models/todo.dart';
import 'package:todolistapp/widgets/todo_item.dart';

void main() {
  testWidgets('TodoItem displays correct information',
      (WidgetTester tester) async {
    final todo = Todo(
      id: '1',
      title: 'Test Todo',
      description: 'This is a test',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoItem(
            todo: todo,
            onUpdate: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('Test Todo'), findsOneWidget);
    expect(find.text('This is a test'), findsOneWidget);
  });
}
