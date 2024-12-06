import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title: title));
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    notifyListeners();
  }

  void updateTaskName(int index, String newName) {
    tasks[index].title = newName;
    notifyListeners();
  }
}

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: 'Enter a new task'),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  taskProvider.addTask(value);
                  taskController.clear();
                }
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return Dismissible(
                    key: Key(task.title),
                    onDismissed: (direction) {
                      taskProvider.deleteTask(index);
                    },
                    child: ListTile(
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          taskProvider.toggleTaskCompletion(index);
                        },
                      ),
                      title: TextField(
                        controller: TextEditingController(text: task.title),
                        onChanged: (value) {
                          taskProvider.updateTaskName(index, value);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (taskController.text.isNotEmpty) {
            taskProvider.addTask(taskController.text);
            taskController.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
