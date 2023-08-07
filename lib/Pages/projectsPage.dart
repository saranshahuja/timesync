import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesync/Pages/ProjectDetailsPage.dart';
import 'package:uuid/uuid.dart';
import '../Models/ProjectList.dart';
import '../Widgets/FirebaseRepository.dart';




class ProjectsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef Ref) {
    final projects = Ref.watch(projectListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index].title),
            subtitle: Text(projects[index].description),
            onTap: () => {}
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Ref.watch(projectListProvider.notifier).addProject(
          Project(id: Uuid().v4(), title: 'New Project', description: 'Description'),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}