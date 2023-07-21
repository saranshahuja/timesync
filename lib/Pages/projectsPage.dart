import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesync/Pages/AddProkjectScreen.dart';
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
        title: Text('Projects', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF0e0e0e),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF0e0e0e),
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(projects[index].title),
                subtitle: Text(projects[index].description),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProjectDetailsPage(project: projects[index])),
                // ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProjectScreen()),
          );
        },

        // => Ref.watch(projectListProvider.notifier).addProject(
        //   Project(id: Uuid().v4(), title: 'New Project', description: 'Description'),
        // ),
        child: Icon(Icons.add),
      ),
    );
  }
}
