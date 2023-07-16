import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/ProjectList.dart';

class ProjectRepository {
  final FirebaseFirestore firestore;

  ProjectRepository(this.firestore);

  Future<void> addProject(Project project) {
    return firestore.collection('projects').doc(project.id).set({
      'title': project.title,
      'description': project.description,
    });
  }

  Future<List<Project>> getProjects() async {
    final querySnapshot = await firestore.collection('projects').get();

    return querySnapshot.docs.map((doc) {
      return Project(
        id: doc.id,
        title: doc['title'] as String,
        description: doc['description'] as String,
      );
    }).toList();
  }

// Add similar methods for tasks and subtasks...
}

final projectRepositoryProvider = Provider<ProjectRepository>((ref) => ProjectRepository(ref.read(firestoreProvider)));



class ProjectNotifier extends StateNotifier<List<Project>> {
  final ProjectRepository projectRepository;

  ProjectNotifier(this.projectRepository) : super([]) {
    loadProjects();
  }

  Future<void> loadProjects() async {
    state = await projectRepository.getProjects();
  }

  Future<void> addProject(Project project) async {
    await projectRepository.addProject(project);
    await loadProjects(); // Reload projects after adding a new one.
  }

// Add similar methods for tasks and subtasks...
}

final projectListProvider = StateNotifierProvider<ProjectNotifier, List<Project>>((ref) => ProjectNotifier(ref.read(projectRepositoryProvider)));
