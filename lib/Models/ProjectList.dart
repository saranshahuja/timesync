import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Project {
  final String id;
  final String title;
  final String description;

  Project({required this.id, required this.title, required this.description});
}

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Task({required this.id, required this.title, required this.description, required this.date});
}

class SubTask {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  SubTask({required this.id, required this.title, required this.description, required this.date});
}

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
