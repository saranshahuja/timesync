import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:timesync/Pages/HomeScreen.dart';
import 'package:timesync/Widgets/FirebaseRepository.dart';
import 'package:uuid/uuid.dart';

import '../Models/ProjectList.dart';

class AddProjectScreen extends ConsumerWidget {
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _projectDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskListProvider);
    List<Task> selectedTasks = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _projectTitleController,
              decoration: InputDecoration(
                labelText: 'Project Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _projectDescriptionController,
              decoration: InputDecoration(
                labelText: 'Project Description',
              ),
            ),
            SizedBox(height: 16.0),
            MultiSelectBottomSheetField<Task>(
              initialChildSize: 0.4,
              listType: MultiSelectListType.CHIP,
              searchable: true,
              buttonText: Text("Select Tasks"),
              title: Text("Tasks"),
              items: allTasks.map((task) => MultiSelectItem<Task>(task, task.title)).toList(),
              onConfirm: (values) {
                selectedTasks = values;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final title = _projectTitleController.text;
                final description = _projectDescriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  final newProject = Project(
                    id: Uuid().v4(),
                    title: title,
                    description: description, tasks: [],
                  );

                  ref.read(projectListProvider.notifier).addProject(newProject);
                  selectedTasks.forEach((task) {
                    ref.read(taskListProvider(task.projectId).notifier).addTask(task);
                  });

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