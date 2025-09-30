import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app_riverpod/todo.dart';
import 'package:to_do_app_riverpod/todo_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final toDoList = ref.watch(todoProvider);
          return ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: toDoList[index].isDone,
                  onChanged: (val) {
                    ref.read(todoProvider.notifier).isFinished(val, index);
                  },
                ),
                title: Text(toDoList[index].title),
                trailing: InkWell(
                  onTap: () => ref.read(todoProvider.notifier).remove(index),
                  child: Icon(Icons.delete, color: Colors.red.shade800),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

showAddTaskForm(BuildContext context) {
  showDialog(
    builder: (context) {
      final controller = TextEditingController();
      return AlertDialog(
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref
                      .read(todoProvider.notifier)
                      .addTask(ToDo(title: controller.text, isDone: false));
                  controller.text = "";
                  Navigator.pop(context);
                },
                child: Text("Add Task"),
              );
            },
          ),
        ],
        title: Text(
          "Task Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter the task"),
        ),
      );
    },
    context: context,
  );
}
