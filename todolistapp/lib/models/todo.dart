import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  Color color;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.color = Colors.white,
  });
}
