import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:timesync/Models/ProjectList.dart';
import 'package:timesync/Pages/AddTaskScreen.dart';

import '../Widgets/chatGPT.dart';

final taskListProvider =
    StateNotifierProvider<TaskList, List<Task>>((ref) => TaskList());

class TaskList extends StateNotifier<List<Task>> {
  TaskList() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }
}

class HomeScreen extends ConsumerWidget {
  final TextEditingController _taskController = TextEditingController();
  final ChatGPT chatGPT = ChatGPT();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      body: Container(
        color: const Color(0xff0e0e0e),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Overview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  autocorrect: true,
                  style: const TextStyle(color: Colors.white),
                  controller: _taskController,

                  decoration: const InputDecoration(

                    filled: true,
                    fillColor: Color(0xffd9d9d9),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Tell your assistant',

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.white),
                        ),
                        onPressed: () {}, child: const Text('To Do')),
                    ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.white),
                        ),
                        onPressed: () {}, child: const Text('Due Today')),
                    ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.white),
                        ),
                        onPressed: () {}, child: const Text('Overdue')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Todays schedule',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.white),
                        ),
                        onPressed: () {}, child: const Text('View all')),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    final task = taskList[index];
                    return ListTile(
                      title: Text(task.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      subtitle: Text(
                          task.description + ' ' + task.date.toIso8601String(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          )),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.white),
                        ),
                        onPressed: () {}, child: const Text('View all')),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      // to disable GridView's scrolling
                      shrinkWrap: true,
                      // You won't see infinite size error
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GlassmorphicFlexContainer(
                            borderRadius: 10,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            border: 1,
                            blur: 20,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GlassmorphicFlexContainer(
                            borderRadius: 10,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            border: 1,
                            blur: 20,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GlassmorphicFlexContainer(
                            borderRadius: 10,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            border: 1,
                            blur: 20,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GlassmorphicFlexContainer(
                            margin: const EdgeInsets.all(50) ,
                            borderRadius: 10,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            border: 1,
                            blur: 20,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],

                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text('Something'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
