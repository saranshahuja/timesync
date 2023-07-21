import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesync/Models/ProjectList.dart';
import 'package:timesync/Pages/HomeScreen.dart';



class ProjectDetailsPage extends ConsumerWidget {
  final Project project;

  ProjectDetailsPage({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef Ref) {
    // Assuming you have a task list in your ProjectNotifier
    final tasks = Ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(tasks[index].title),
            children: tasks[index].subTasks.map((subTask) {
              return ListTile(
                title: Text(subTask.title),
                subtitle: Text(subTask.description),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskDetailsPage(task: tasks[index])),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class TaskDetailsPage extends StatelessWidget {
  final Task task;

  TaskDetailsPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: ListView.builder(
        itemCount: task.subTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(task.subTasks[index].title),
            subtitle: Text(task.subTasks[index].description),
          );
        },
      ),
    );
  }
}