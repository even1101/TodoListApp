import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoForm extends StatefulWidget {
  final Todo? todo;
  final Function(String, String, Color) onSave;

  TodoForm({this.todo, required this.onSave});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late Color _color;

  final List<Color> _colorOptions = [
    Colors.white,
    Colors.red[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.yellow[100]!,
  ];

  @override
  void initState() {
    super.initState();
    _title = widget.todo?.title ?? '';
    _description = widget.todo?.description ?? '';
    _color = widget.todo?.color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _title,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) => _title = value!,
          ),
          SizedBox(height: 16),
          TextFormField(
            initialValue: _description,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            onSaved: (value) => _description = value!,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _colorOptions.map((Color color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _color = color;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _color == color ? Colors.black : Colors.grey,
                      width: _color == color ? 2 : 1,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSave(_title, _description, _color);
              }
            },
          ),
        ],
      ),
    );
  }
}
