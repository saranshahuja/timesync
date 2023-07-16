import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDate;
  List<Task> _tasks = [
    Task(DateTime(2023, 7, 1), "Meeting"),
    Task(DateTime(2023, 7, 5), "Gym"),
    Task(DateTime(2023, 7, 5), "Shopping"),
    Task(DateTime(2023, 7, 7), "Dinner with friends"),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
  }

  List<Task> _getTasksForSelectedDate(DateTime date) {
    return _tasks.where((task) {
      return task.date.year == date.year &&
          task.date.month == date.month &&
          task.date.day == date.day;
    }).toList();
  }

  void _updateTask(Task task, String newTaskName) {
    setState(() {
      task.taskName = newTaskName;
    });
  }

  void _createTask(DateTime date, String taskName) {
    setState(() {
      _tasks.add(Task(date, taskName));
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDate,
            firstDay: DateTime(DateTime.now().year, DateTime.now().month),
            lastDay: DateTime(DateTime.now().year + 1),
            selectedDayPredicate: (date) {
              return isSameDay(date, _selectedDate);
            },
            onDaySelected: _onDaySelected,
          ),
          SizedBox(height: 20),
          Text(
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: _getTasksForSelectedDate(_selectedDate)
                  .map((task) => ListTile(
                title: Text(task.taskName),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(task),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      String newTaskName = task.taskName;
                      return AlertDialog(
                        title: Text('Update Task'),
                        content: TextField(
                          onChanged: (value) {
                            newTaskName = value;
                          },
                          decoration:
                          InputDecoration(hintText: 'Task Name'),
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Update'),
                            onPressed: () {
                              _updateTask(task, newTaskName);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              DateTime newTaskDate = _selectedDate;
              String newTaskName = '';
              return AlertDialog(
                title: Text('Create Task'),
                content: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        newTaskName = value;
                      },
                      decoration: InputDecoration(hintText: 'Task Name'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Selected Date: ${newTaskDate.day}/${newTaskDate.month}/${newTaskDate.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Select Date'),
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: newTaskDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2024),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            newTaskDate = pickedDate;
                          });
                        }
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Create'),
                    onPressed: () {
                      _createTask(newTaskDate, newTaskName);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class Task {
  DateTime date;
  String taskName;

  Task(this.date, this.taskName);
}
