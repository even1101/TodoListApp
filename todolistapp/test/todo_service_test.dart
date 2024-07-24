test('should delete a todo', () {
  final todo = Todo(
    id: '1',
    title: 'Test Todo',
    description: 'This is a test',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  todoService.addTodo(todo);
  expect(todoService.todos.length, 1);

  todoService.deleteTodo('1');
  expect(todoService.todos.length, 0);
});