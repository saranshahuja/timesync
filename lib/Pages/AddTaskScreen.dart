import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../Models/ProjectList.dart';
import 'HomeScreen.dart';



class AddTaskScreen extends ConsumerWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final Priority priority = Priority.low; // Set a default value

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date (yyyy-mm-dd)',
              ),
            ),
            SizedBox(height: 16.0),
            // Here you could add widgets to select the Priority and add SubTasks, or assign the Task to a Project
            ElevatedButton(
              onPressed: () {
                final title = _taskController.text;
                final description = _descriptionController.text;
                final date = DateTime.parse(_dateController.text);

                if (title.isNotEmpty && description.isNotEmpty && date != null) {
                  final task = Task(
                    id: Uuid().v4(),
                    title: title,
                    description: description,
                    date: date,
                    priority: priority, // Use the selected priority
                    subTasks: [], // Use the added SubTasks
                  );
                  ref.watch(taskListProvider as ProviderListenable).addTask(task);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}