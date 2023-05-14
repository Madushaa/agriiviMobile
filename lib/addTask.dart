import 'package:flutter/material.dart';

class Task {
  String name;
  String description;
  DateTime date;

  Task({
    required this.name,
    required this.description,
    required this.date,
  });
}

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final _tasks = <Task>[];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddTaskDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  final task = Task(
                    name: nameController.text,
                    description: descriptionController.text,
                    date: DateTime.now(),
                  );

                  _addTask(task);

                  Navigator.pop(context);
                },
                child: Text('Add Task'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greenhouse Farm Tasks'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];

          return Dismissible(
            key: Key(task.name),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _removeTask(index);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete),
              alignment: Alignment.centerRight,
            ),
            child: ListTile(
              title: Text(task.name),
              subtitle: Text(task.description),
              trailing: Text(
                '${task.date.month}/${task.date.day}/${task.date.year}',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
