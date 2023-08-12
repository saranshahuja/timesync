import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Priority { low, medium, high, urgent }

class Project {
  final String id;
  final String title;
  final String description;
  
  final List<Task> tasks;

  Project({required this.id, required this.title, required this.description, required this.tasks});
}

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Priority priority;
  final List<SubTask> subTasks;

  Task({required this.id, required this.title, required this.description, required this.date, required this.priority, required this.subTasks});

}

class SubTask {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Priority priority;

  SubTask({required this.id, required this.title, required this.description, required this.date, required this.priority});
}
